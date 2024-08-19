Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838D1DD3A0
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 23:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724108774; cv=none; b=TnqS/+NJEoNo8YYwKiYxSVnVVrOUB+3rGOKwG8/M4YphoJT1v7he28HBU3aWFG69nlX8LP/F6EN969T7weavnLEz9PDPBsv03x+6xU9k1oPtA0dT3g7qCt8gECH7o4c8S3S+S4HCuBGUP45Cwb7MuaoQgF2AesbaZofhXDyNbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724108774; c=relaxed/simple;
	bh=plHoBq5KbfGDrv6dOpY2JUmRVsjTfFCvCQ7zjz1FPA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKzMLm2SWUIupMT7XWmG/A4hHckx12JNVHtyHsXj8XTSSrh2KyiDv65W56wScn9JYm+beDpCgK4BtNOxa52gsbgnGwNo//T7k6C8SWBuLnMCttcv50PsGggW3W1JQiZ5Kvg+pRBW/rgIylF7RhvFqo4fIe9s9eo8o/uDlO/yMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dxuXZthQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dxuXZthQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc47abc040so37388745ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724108772; x=1724713572; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAaL9iLsfBr3KmkxqVCqI8crZ4M3zG1jsxZQrqUkREk=;
        b=dxuXZthQKQ3FvCKBUic3RAyCoBZnjHmYtGO4yoqk/2uRLXyxYMTuegdyMO74/VdHqo
         VxXejpaN1McZk3v2I8EXqfZ7PgcgoycHO+EfFYvH+LAmb38h0H1v/bqIk6rnEpJXqISj
         J4vViWbt+5pOI73kIUPcg0PQx3JpBvLOkzy3DuKsQETOvC1Ps3BGThFysCJzqGrmyGw1
         BcB4LxYxI2DTMsht3HnUWC52RavqLvJNl8mYlQDQNWkTrb46/dMKKxMn7FmWHNIPvudF
         wEMNtEkoMspiES5GAwx78l2Hblk52z5qd1ooLuD2GnrkU/cidkLg++pTw+o2lPGFTtH/
         KlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724108772; x=1724713572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAaL9iLsfBr3KmkxqVCqI8crZ4M3zG1jsxZQrqUkREk=;
        b=fzlSF7LfHt8KQMTLF90pXcPqbzLNoFlRcEXxJpd8ZJiu8UsS1tzyE+oM0eh3EKq/5N
         nijRf37FqaE9jYlOjBA810PhjnxG3JvnP2G8+qpjOYntCd+MiLPDEfAUNG8QBP1efPaH
         VzxpMbcJ2eCELAzD55EzizFqF2a4n+TQeg1nskU8bl8OWRe8yNwLVrq/jCG0f4lSYK8N
         P7FGLFwPUMG0brPjhUxD5j+2sxGBdQqNkHNHB+08Xig15BCg7Vez4Cnygkp6KTvMX8bS
         z+3Nz7KJqb7tZS+xjXDb0kQ8B0/xjIwVhWNriv4ELLxfIpVUO4i8Jx0x3bmwMkCuvAMc
         LkAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG19h+Pu9JSKuq+A0nVQsniY2HGxoHjHI1/tt2ofCtYJrQTFms/Dm014Ii10sR5hYbNnpvytV54Ba/sduJG57vmYcykKNHEF6jOAA=
X-Gm-Message-State: AOJu0Yx00BfS62cGjKC8vUl5Qm1ak+wWysukMx3ZArdVMVpPpOi5mOPQ
	IEzOMsiZepHeT2Rse6iqP5+rmG7b/YAR6kXQeZw0yVWQAPTP4xBH+SKcgAu00Eo=
X-Google-Smtp-Source: AGHT+IHBfVyuiRiWWmeZGAb3eMUhDH5U34j0O0Tsptrx7dedS32uu6dqmeIX1/j/vghFFG3MWZ8Y4w==
X-Received: by 2002:a17:902:da84:b0:201:fac8:ff68 with SMTP id d9443c01a7336-2031517e5bcmr5848595ad.50.1724108772271;
        Mon, 19 Aug 2024 16:06:12 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f037592csm67028215ad.142.2024.08.19.16.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 16:06:11 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:06:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Message-ID: <ZsPP4GMwPVBfq+fL@ghost>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
 <ZrqsqsCtKwfG4Q5B@ghost>
 <20240813-strode-revival-07b8556a8bfe@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-strode-revival-07b8556a8bfe@spud>

On Tue, Aug 13, 2024 at 04:55:27PM +0100, Conor Dooley wrote:
> On Mon, Aug 12, 2024 at 05:45:30PM -0700, Charlie Jenkins wrote:
> > On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> > > On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > > > xtheadvector is a custom extension that is based upon riscv vector
> > > > version 0.7.1 [1]. All of the vector routines have been modified to
> > > > support this alternative vector version based upon whether xtheadvector
> > > > was determined to be supported at boot.
> > > > 
> > > > vlenb is not supported on the existing xtheadvector hardware, so a
> > > > devicetree property thead,vlenb is added to provide the vlenb to Linux.
> > > > 
> > > > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
> > > > used to request which thead vendor extensions are supported on the
> > > > current platform. This allows future vendors to allocate hwprobe keys
> > > > for their vendor.
> > > > 
> > > > Support for xtheadvector is also added to the vector kselftests.
> > > 
> > > So uh, since noone seems to have brought it up, in the light of the issues
> > > with thead's vector implementation, (https://ghostwriteattack.com/) do we
> > > want to enable it at all?
> > 
> > I can make it clear in the kconfig that xtheadvector is succeptible to
> > this attack and that it should be enabled with caution. I think we
> > should let people that understand the risk to enable it.
> 
> I think the clearest way might be "depends on BROKEN"?

Sorry for the delay, I am not sure if BROKEN is the best way of doing
this. There is the generic CPU_MITIGATIONS config that I think we should
use to handle this at boot time. This would allow generic kernels to be
used on the platform, but a kernel config of "mitigations=off" would
allow xtheadvector to be enabled. I'll look into this a bit more and
send out a patch. Palmer merged a patch into for-next to enable
GENERIC_CPU_VULNERABILITIES for riscv so I will add ghostwrite there
as well.

- Charlie

