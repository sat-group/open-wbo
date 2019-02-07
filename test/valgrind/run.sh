#!/usr/bin/env bash
#
# Check via valgrind

# make sure we see what is executed, and fail early
set -e -x

# go to this directory
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# build the debug version
if [ -d "$script_dir"/../.. ]
then
	pushd "$script_dir"/../..
	make clean
	pwd; make d -j $(nproc)
	popd
fi

# make sure we are working where the cnfs are located
pushd "$script_dir"

# start fresh
rm -f *.log

# let's iterate over all input files
for file in *.cnf
do
	echo "check file $file"
	b=$(basename $file)

	# check parameters of interestw
	for parameter in ""
	do

		LOGFILE="$b-$parameter.log"

		# run tool via valgrind
		valgrind -v \
			--track-origins=yes \
			--leak-check=full \
			--show-leak-kinds=all \
			"$script_dir"/../../open-wbo_debug \
				$parameter \
				$file |& tee "$LOGFILE"

		# make sure we do not have any errors
		grep "ERROR SUMMARY: 0 errors" "$LOGFILE" || exit 1

	done
done

# return back to calling directory
popd

echo "SUCCESS!"
