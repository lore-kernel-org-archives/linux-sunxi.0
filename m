Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259D450E2
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721686472; cv=none; b=DV3xv0VSHcTip/qjMzroVyw0PfOL+8m9KaOHygdavXPCTBW4GBht36SHlRUtfVfOk+7u7uGpn7S6TLkxk4BsSvnjlkKFZawnOb4w7KbmUxiKws+B8q7B3mXyEsnAFajahKplDc28MfH3Jk5+CfcEXx7HHRhn2RoLJgNXezyxgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721686472; c=relaxed/simple;
	bh=dhQAkBGjBezAxdphX9peoUeOYqVnNFKTd3jL3rug1no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE/dCjaolJUpJlWafD4eP+3tfPd1+/jApNBLxaJ34IHlegvXGPAFj9ajMWFYgjWvODL9cBxVdmNYCxUmUS2h7DK8zTpTaQgLwstcTfPQUKfe3DwjtEufggnCbkb0oeNpMsetjzQLeEWKLDhOrwnIolYmk2XjHuye3WwgkQ0Wuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sZs0M6w5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sZs0M6w5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb585375f6so2825684a91.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721686468; x=1722291268; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnI7oybV/HUbAbtJY8v1K+OhuBn76sevmv9uupEuIgE=;
        b=sZs0M6w5oo1d5Rsn9FGfuV0AHC+rniHJetNmpizC7zKU9+s+OKqB60oWpeTqIlWrYZ
         Oc2QnOYPB9BBMyMFNKTYRMKu/AAyXf7IgWrff1NIt3jF8ZZRcHWkgIcOIIDBe7oYlc1D
         Z0jqc6ZVvGnQepf3yvPhIQyCQhGE1c2SC/p6TlAJcWb6anVK6AYVkibamd6FvkPEnVRN
         h0WT3BcVWGtAjlYun7x406o3bbDzTdqlGPf73U3I/RBdD2Iy4ksGSdDDqk+uN5xZPUBH
         HPGS/7nSr8lFCm7XCDQIjTxFuzpjoLtmQjy6aQTfs4ohhQzGQoHAnEd2N+GLil4uL4oa
         3Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686468; x=1722291268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnI7oybV/HUbAbtJY8v1K+OhuBn76sevmv9uupEuIgE=;
        b=BTEx9Lf769lLwcWPNXxd49q+sCTkVXP5g1jUs8uawnNMvj1x3jRxgxcpz5nyCpBau8
         2hSw3MfiyFqM11Hr+MnZpKHLk9Cqfg0DpRXzHiyNrMqbMcJLAzOsKyXlkiWuwyKSuGUd
         Z0x80i5VqOxoOl3SKczmdDreTXRk7Yiu9I46Q31y8IQ65CXXeSmDjO0O8tsr0t4C0Fqf
         E+KP4zoEENQfLRk/4xkgznnJbBDcGyiEigVRSZDM0BV2mbMGpjtvdqKM7hojed+NeJGN
         gV9Jh38qZUVm3lzWFFgLsuOfHgK30cEI6EF/3dQz074YNbDPKmQrkpc6c2CPyCXU9T7Z
         Xp+g==
X-Forwarded-Encrypted: i=1; AJvYcCX9XEO/Dc1JCfp5tKYTborjvYFTJUfwAvYAP5tHPfgJQE3aXP+QMenkawW5cNr5RgBlUu9YqThkgzHo1C4e0mcRra/VLrJ1fnVJ+AY=
X-Gm-Message-State: AOJu0YzDrNcBT8T3IsjQmhq2FYqIAiPF9SXAl5ghHFZY3MZQWHklTsiF
	Q+UXcFB831TdGcfeq//IJcHK1JF4pKJOxV0BrWho/9mMO+xPAhhA95HnrGs3Re4=
X-Google-Smtp-Source: AGHT+IGbj7DZDu9xdtM7I7b4ely54D1XMYZd7nuHar0IVRmTLnQwyoFRYH9nBIDP0Zw2wpAFGDB+eA==
X-Received: by 2002:a17:90a:d584:b0:2c9:8189:9cc1 with SMTP id 98e67ed59e1d1-2cd85d19266mr971305a91.21.1721686468300;
        Mon, 22 Jul 2024 15:14:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bb49sm60018365ad.131.2024.07.22.15.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:14:27 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:14:24 -0700
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
Message-ID: <Zp7ZwDzpFt7iJ6iT@ghost>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
 <Zp7LxAWkDQMQhVLq@ghost>
 <20240722-86a2b1fa474d71c4dbc557c7@orel>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722-86a2b1fa474d71c4dbc557c7@orel>

On Mon, Jul 22, 2024 at 05:08:22PM -0500, Andrew Jones wrote:
> On Mon, Jul 22, 2024 at 02:14:44PM GMT, Charlie Jenkins wrote:
> > On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> > > On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > > > Overhaul the riscv vector tests to use kselftest_harness to help the
> > > > test cases correctly report the results and decouple the individual test
> > > > cases from each other. With this refactoring, only run the test cases is
> > > > vector is reported and properly report the test case as skipped
> > > > otherwise. The v_initval_nolibc test was previously not checking if
> > > > vector was supported and used a function (malloc) which invalidates
> > > > the state of the vector registers.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> > > >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> > > >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> > > >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> > > >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> > > >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> > > >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> > > >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> > > >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> > > >  9 files changed, 324 insertions(+), 191 deletions(-)
> > > > 
> > > > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > > > new file mode 100755
> > > > index 000000000000..2b03e77b4dcf
> > > > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > > > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > > > index 9ae7964491d5..7d9c87cd0649 100644
> > > > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > > > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > > > @@ -1,3 +1,4 @@
> > > >  vstate_exec_nolibc
> > > >  vstate_prctl
> > > > -v_initval_nolibc
> > > > +v_initval
> > > > +v_exec_initval_nolibc
> > > > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > > > index bfff0ff4f3be..995746359477 100644
> > > > --- a/tools/testing/selftests/riscv/vector/Makefile
> > > > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > > > @@ -2,18 +2,27 @@
> > > >  # Copyright (C) 2021 ARM Limited
> > > >  # Originally tools/testing/arm64/abi/Makefile
> > > >  
> > > > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > > > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > > > +TEST_GEN_PROGS := v_initval vstate_prctl
> > > > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> > > >  
> > > >  include ../../lib.mk
> > > >  
> > > > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > > > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > > >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > > >  
> > > >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> > > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > > >  
> > > > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > > > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > > > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> > > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > > > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > > new file mode 100644
> > > > index 000000000000..74b13806baf0
> > > > --- /dev/null
> > > > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > > @@ -0,0 +1,84 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Get values of vector registers as soon as the program starts to test if
> > > > + * is properly cleaning the values before starting a new program. Vector
> > > > + * registers are caller saved, so no function calls may happen before reading
> > > > + * the values. To further ensure consistency, this file is compiled without
> > > > + * libc and without auto-vectorization.
> > > > + *
> > > > + * To be "clean" all values must be either all ones or all zeroes.
> > > > + */
> > > > +
> > > > +#define __stringify_1(x...)	#x
> > > > +#define __stringify(x...)	__stringify_1(x)
> > > > +
> > > > +int main(int argc, char **argv)
> > > > +{
> > > > +	char prev_value = 0, value;
> > > > +	unsigned long vl;
> > > > +	int first = 1;
> > > > +
> > > > +	asm volatile (
> > > > +		".option push\n\t"
> > > > +		".option arch, +v\n\t"
> > > > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > > > +		".option pop\n\t"
> > > > +		: [vl] "=r" (vl)
> > > > +	);
> > > > +
> > > > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > > > +	for (int i = 0; i < vl; i++) {						\
> > > > +		asm volatile (							\
> > > > +			".option push\n\t"					\
> > > > +			".option arch, +v\n\t"					\
> > > > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > > > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > > > +			".option pop\n\t"					\
> > > > +			: "=r" (value));					\
> > > > +		if (first) {							\
> > > > +			first = 0;						\
> > > > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > > > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > > > +			exit(-1);						\
> > > 
> > > I think we should ensure all tests in tools/testing/selftests/riscv/ use
> > > TAP output, exiting with ksft_finished(), or at least exit with 0 for
> > > success. For example, vstate_exec_nolibc exits with 2 for success since
> > > it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> > > vstate_prctl.c exits with several different negative values, which means
> > > it'll exit with several different values around 255. To figure what went
> > > wrong, one will have to convert those exit codes to the original negative
> > > values in order to look them up. Having these types of inconsistent exit
> > > values complicates QA.
> > > 
> > > Thanks,
> > > drew
> > 
> > I do not follow. I am using the kselftest_harness
> > (tools/testing/selftests/kselftest_harness.h) that does output using the
> > TAP format. vstate_exec_nolibc is not a test in itself but is a helper.
> 
> Ah, this was my misunderstanding, as I'm used to all files with main()
> being independent tests and I only grepped exit codes. I'll have to look
> to see how this all fits together.
> 
> > The Makefile for the vector tests describes this as:
> > 
> > TEST_GEN_PROGS := v_initval vstate_prctl
> > 
> > If you run the riscv collection of tests with:
> > 
> > $ ./run_kselftest.sh --collection riscv
> 
> I'll look later, but I hope those tests can also be run standalone and
> still get TAP output.
> 
> Thanks,
> drew

Yes, running v_initval and vstate_prctl standalone does provide TAP
output.

- Charlie

> 
> > 
> > You will see that the only vector test cases are v_initval and
> > vstate_prctl, which both output as expected in TAP format.
> > 
> > I do see that I messed up the return type of the is_vector_supported()
> > function, I had meant to change that to a bool from an int since
> > RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
> > version.
> > 
> > - Charlie
> > 
