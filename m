Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859145014
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682891; cv=none; b=e+wOOfe3sExD+zZdG8A6ad3W4tolUkdh3RpRxSOq7/Yas7VooOQFHd0/UM83o6SZE932vDnZrGkgg2uOWDFq7tRg55w985FC8/ABRTW8ekO1JCDIQ6+GADhMtU154grAYvMlyMwBAHQmfvQ6Xw7783jZ9IYovXQNKpL5Kdtq9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682891; c=relaxed/simple;
	bh=1lagUwf3RC7JZReX5Mnpd7A0gWXy3u+C9i+YHhmoyxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdYLYb0KHRO3Xr5GvRrjR01Ov9P/huy/zjVP9cJIrHuSB7FRIUgv/p5mDSpulLRcxZwm1pi6Nf+1ufxZX2pWaC5bXjujmyJhgLVPJTXTLfa3JW5qb7Nz7QcRmVTHjp9YcrM2YZzhum0tc0F9Puu29GQ2fx7WNvHbPMYiCLcOwzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gw72jPaC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gw72jPaC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd90c2fc68so798655ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721682889; x=1722287689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=gw72jPaCXLcUDTdmTaws/cmu2DRLV2EPN8mpMbzvc73krFPZYWAb1eZyvIcqJMHHjO
         k6SLfFSg9X/xETBQH71h66IwUSrw96FE9zz04egb04MQwGkuZBZktxW1Vgjus6PDObNO
         7BMKpWJqQGWLshmqRjpExMURXBJFWaf7GAAh00EC4xTRmA3CE2QaMxNld+mnsxvOxII6
         10QBQw9lRWOz1cVKyuq5MJ8xFMVbpwlyCgUT4HM5pVORKjKzXGf0VPQiyeY/DjC9c5Wn
         3bYXnl0e/pEeUeUpqtdZ3Hq4mu/1Jn31z1e/a1kMnR3l9vQciVsQJIR70/PPGjivu8DT
         OJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682889; x=1722287689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=vPJkjinlhe7c66AlDq+Prg6lASZ3cwK4alYIcQimhznuRO3Pfacy4J+e8a+H2ZLOfJ
         ppghRRT8o8WQpDl6n7NT6uk44FKc5goaI7/pNCybIr6YrxzSnmmVHLIjIW91B7lsqseo
         GIFkRTZDSBr7jt3HkNihpr7HrwZtBKqt2jugcEY8WpJDBL4OV5hpAmzSod4rwTgRauNf
         Sce0z5X4AKUoBMhGmOmOfMNgkWp5simYBx9OU9t1ea3hn6w0BIhYcuax6KJJ6CxA3nzK
         G/4xQw3jyNE5mPV/dGZdsS4biFjn4u+AnBuKO8i1ZeD7/4/BPof1TM4eRHNTtkbLp4af
         0auQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1KpB6Q7uj5mIJYIK8ZLx9qDS/XFMCDTEtBreiJeVlRmZVzi9SLxvUrCZ7s4kPasKNrY6cimHAgsUjsZT/b3jbevA0y3ieIdjkXho=
X-Gm-Message-State: AOJu0YzN6OikQ6Z0bDocfxH1ZWqT1KwcMYV3/V8vV2dbYp8IJDfdg1uk
	bs5Ce/a3+1Pfe5InmtdA2h6b5qd9a1Ivy4aa57emiJmhAxH4TUMck2lfVeskGCk=
X-Google-Smtp-Source: AGHT+IHNGpumvDD95UYgz2v1+PPZ4GlU1XFvLWIOWNaPJpQc9m08TfGb1igAHvmYgQ6MZbrThHXc8A==
X-Received: by 2002:a17:902:db02:b0:1fb:4b87:6e9d with SMTP id d9443c01a7336-1fdb5f6b95fmr9284455ad.42.1721682888632;
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f485bd1sm59363665ad.275.2024.07.22.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Date: Mon, 22 Jul 2024 14:14:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/13] selftests: riscv: Fix vector tests
Message-ID: <Zp7LxAWkDQMQhVLq@ghost>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722-0940cd64c0d8bb03f2427022@orel>

On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > Overhaul the riscv vector tests to use kselftest_harness to help the
> > test cases correctly report the results and decouple the individual test
> > cases from each other. With this refactoring, only run the test cases is
> > vector is reported and properly report the test case as skipped
> > otherwise. The v_initval_nolibc test was previously not checking if
> > vector was supported and used a function (malloc) which invalidates
> > the state of the vector registers.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> >  9 files changed, 324 insertions(+), 191 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > new file mode 100755
> > index 000000000000..2b03e77b4dcf
> > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > index 9ae7964491d5..7d9c87cd0649 100644
> > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > @@ -1,3 +1,4 @@
> >  vstate_exec_nolibc
> >  vstate_prctl
> > -v_initval_nolibc
> > +v_initval
> > +v_exec_initval_nolibc
> > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > index bfff0ff4f3be..995746359477 100644
> > --- a/tools/testing/selftests/riscv/vector/Makefile
> > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > @@ -2,18 +2,27 @@
> >  # Copyright (C) 2021 ARM Limited
> >  # Originally tools/testing/arm64/abi/Makefile
> >  
> > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > +TEST_GEN_PROGS := v_initval vstate_prctl
> > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> >  
> >  include ../../lib.mk
> >  
> > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> >  
> >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> >  
> > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > +
> > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > new file mode 100644
> > index 000000000000..74b13806baf0
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Get values of vector registers as soon as the program starts to test if
> > + * is properly cleaning the values before starting a new program. Vector
> > + * registers are caller saved, so no function calls may happen before reading
> > + * the values. To further ensure consistency, this file is compiled without
> > + * libc and without auto-vectorization.
> > + *
> > + * To be "clean" all values must be either all ones or all zeroes.
> > + */
> > +
> > +#define __stringify_1(x...)	#x
> > +#define __stringify(x...)	__stringify_1(x)
> > +
> > +int main(int argc, char **argv)
> > +{
> > +	char prev_value = 0, value;
> > +	unsigned long vl;
> > +	int first = 1;
> > +
> > +	asm volatile (
> > +		".option push\n\t"
> > +		".option arch, +v\n\t"
> > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > +		".option pop\n\t"
> > +		: [vl] "=r" (vl)
> > +	);
> > +
> > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > +	for (int i = 0; i < vl; i++) {						\
> > +		asm volatile (							\
> > +			".option push\n\t"					\
> > +			".option arch, +v\n\t"					\
> > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > +			".option pop\n\t"					\
> > +			: "=r" (value));					\
> > +		if (first) {							\
> > +			first = 0;						\
> > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > +			exit(-1);						\
> 
> I think we should ensure all tests in tools/testing/selftests/riscv/ use
> TAP output, exiting with ksft_finished(), or at least exit with 0 for
> success. For example, vstate_exec_nolibc exits with 2 for success since
> it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> vstate_prctl.c exits with several different negative values, which means
> it'll exit with several different values around 255. To figure what went
> wrong, one will have to convert those exit codes to the original negative
> values in order to look them up. Having these types of inconsistent exit
> values complicates QA.
> 
> Thanks,
> drew

I do not follow. I am using the kselftest_harness
(tools/testing/selftests/kselftest_harness.h) that does output using the
TAP format. vstate_exec_nolibc is not a test in itself but is a helper.
The Makefile for the vector tests describes this as:

TEST_GEN_PROGS := v_initval vstate_prctl

If you run the riscv collection of tests with:

$ ./run_kselftest.sh --collection riscv

You will see that the only vector test cases are v_initval and
vstate_prctl, which both output as expected in TAP format.

I do see that I messed up the return type of the is_vector_supported()
function, I had meant to change that to a bool from an int since
RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
version.

- Charlie

