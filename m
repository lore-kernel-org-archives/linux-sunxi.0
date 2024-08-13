Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B726AAD
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Aug 2024 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723509936; cv=none; b=NDmQbGAOgOLRVBddusMuPitCWf8781XjFI3XfJrq/dmUmNKKSfb4PPzwehrQlTdot7f+Rn9I/ZxBAE/VoO+z45An1NKfMORGOvbHBK13JcqHTOQjJfnhi5J+U15ngdxq/D8adb9xmUJ6KsDS0hd58TbL7XM4taiBor8dWR44hgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723509936; c=relaxed/simple;
	bh=1sBgTIKoJ6AjCZ9d/4YTN6ajHX8hpg8Jnb/EcKKS2RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQij6Ptj+wjKWpE62Nr3cDp5UY34X8tWZcJ6rE4JCHUqTW3G7p9ZLBC3cvbM3cdDeEvjWeAqYHOG6NNPOWpB9+4LX7Q+IHHvxrOE1nE7kTMV0xYqZyZmKFRNPX1SAzUFapkSteQeMFBGuJQb7EgXI5jthkSzeDo/bluC/MBZ6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Aj6jiFK+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Aj6jiFK+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ff1cd07f56so41143635ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Aug 2024 17:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723509934; x=1724114734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Beo73jI8KH5p03NxQPXLaupS8Ut84TtJmPr0+Y+H6g=;
        b=Aj6jiFK+ZCUYbEa2aBowwAASxRPjYF/OxYpeydVTuV/4y0ovosqI84ZDsEiZeqc9fO
         cMbQCBtKRlaF6atQIumkxJTqQaBlfgJQz8YAC1peIPjnbIcCfW/wac9M5Vo5rW/2vJo1
         imlWl2NhGRNVmvG6pWk2LU8gubNuXn/pQe7kdu99oIvGiM6faFWg9lXsQp7rklcfT54y
         VITIWYxxqGiz5ucknIIa+lBL0aDwPC5R8+6NEVUMj56g4ixTFUif480d9W6sT5mwresV
         c7BTZvi/KRwh3mTbfRgdJ7pLicq1WTuAHeadPwsWLzP3ekyHym3VF5DNpkdA3Wu5JLBf
         PU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723509934; x=1724114734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Beo73jI8KH5p03NxQPXLaupS8Ut84TtJmPr0+Y+H6g=;
        b=wHRMToLuwArRimUKhGrO8qicT8FMwqfLvDq+VhqAsWHw1ag0SX0pOjv77dMSkDjG6N
         vVcxux6/gA3xNqfrz8rQ2QkHuORRSpYBY+GB0nKgHAzYlLD2O9VkuQx2i6AFnz1/Q2Ap
         Sq8Yhs9RYHP3mab9zp7MTC9LqC4ncUb9y38WtG05TacgcTyRRFc5d1SKE1vl//hINVj3
         Mjk8ko49Bz6mnYUMyGLjzmj/jlsMcvhTNDtP/d+Zph7pz4W83noHdo+7esATRFRicPZM
         7cPG4/Bt+53eNxvmkr+FG6t063NbI0kkgmcq5JCRDGwR3gZhocgKnvPg2tqyFf7H1v43
         kqJg==
X-Forwarded-Encrypted: i=1; AJvYcCXrwQysoQzC17N5Bsj4SZU/tnGaYaYpQSW7/73gH74rl9WL6ytupiE8d4A3l+ucdIZbd0PJg4tlpGH2Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoBr1emfnkM2+W6LmvthxONgdmnN4z9p11i0dNdECkEeerm54v
	zQ4vHoekvPb+1Wufrm3ERQhtJ9ug1J5Zr+2P99EdYbR0ahyyLNEBSBLlzNa2P6o=
X-Google-Smtp-Source: AGHT+IHdEc1RzSfknb4O0tEELFITV1/FMiLC99gVJNOSQQB/c+hZmMPVy98DA8PMYeZcE4ZXSNQJNQ==
X-Received: by 2002:a17:902:e80b:b0:1fb:57e7:5bb4 with SMTP id d9443c01a7336-201ca1831c4mr26201755ad.37.1723509934094;
        Mon, 12 Aug 2024 17:45:34 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:239c:9f30:d4d6:f989])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1c86ddsm2537295ad.263.2024.08.12.17.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 17:45:33 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:45:30 -0700
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
Message-ID: <ZrqsqsCtKwfG4Q5B@ghost>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240809-slapping-graph-461287bac506@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-slapping-graph-461287bac506@spud>

On Fri, Aug 09, 2024 at 11:31:15PM +0100, Conor Dooley wrote:
> On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> > xtheadvector is a custom extension that is based upon riscv vector
> > version 0.7.1 [1]. All of the vector routines have been modified to
> > support this alternative vector version based upon whether xtheadvector
> > was determined to be supported at boot.
> > 
> > vlenb is not supported on the existing xtheadvector hardware, so a
> > devicetree property thead,vlenb is added to provide the vlenb to Linux.
> > 
> > There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
> > used to request which thead vendor extensions are supported on the
> > current platform. This allows future vendors to allocate hwprobe keys
> > for their vendor.
> > 
> > Support for xtheadvector is also added to the vector kselftests.
> 
> So uh, since noone seems to have brought it up, in the light of the issues
> with thead's vector implementation, (https://ghostwriteattack.com/) do we
> want to enable it at all?

I can make it clear in the kconfig that xtheadvector is succeptible to
this attack and that it should be enabled with caution. I think we
should let people that understand the risk to enable it.

- Charlie

