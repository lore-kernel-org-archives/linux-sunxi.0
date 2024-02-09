Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E983CAA
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707505323; cv=none; b=imJmIxIjJlUqoYmwf4E/uhkiEnaaTu01aosq1Mx5XRazj4d/YZi+G437lgXJ1Dx8b6JrABO8ZuoiRVvzfjUo9LRVjv+yEmrBjQPwWxedFzreZKoMyx+E5+/QJ2SOl0Rtbhdes/yGBG/7dFSHjF3kIwtb+AoMLJM5Q+PFM2jDcRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707505323; c=relaxed/simple;
	bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqG0u1KMfdl3xgenPygO8EQ6EDLz1Jq3yycN/lzblg9FMaZ78r9qF1q49Dz64+J9S2jy8GGVy28ta7T3c0Kv7t88f2F/QL52tx6mGr1fjPMcUVSHkPTaSmEGBPlhV3Grqyw7rnOSIjDe6njYGFwGC0NjFlXHjz/A3BBmA/oLXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com; spf=none smtp.mailfrom=soleen.com; dkim=fail (0-bit key) header.d=soleen.com header.i=@soleen.com header.b=pRk8Okfe reason="key not found in DNS"; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=soleen.com header.i=@soleen.com header.b="pRk8Okfe"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42aa4a9d984so5759811cf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Feb 2024 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1707505321; x=1708110121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
        b=pRk8OkfeZ6kvZAUpivcWGkX+uOYQB8FYSqC3yH93siCj6CzpPRloH1TCWeIGkqJ7mB
         W5d71JzBld+XoVktHGUfQCw1z2sJixp754T0WKBF2ohQsG1rUjr6RxtdEJLkU2DFACkr
         KDWSz6/cajtm4FSaoTcKy5zZtX7b/OpPIT64y7kYZOWk9eUj7LXoqI/I5oa9UphbFhDV
         MO4DmbQCS3I7fW+JwBqpvRkm/veaQ2gAYEX1Txbmyft9vqQLmws+lPXjSFY4O2Nlhyzx
         1dCPh8xXOSaUyZZshivclMYYOgAGZ93VsJSGjryWi5tCc05I+k4Os93/Y8ZurM6EuMhO
         fkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707505321; x=1708110121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2GAPlcgJGDaQINPFrlt1R7Ny0c1Ad/P9P2yI23KbDE=;
        b=bNmM1I//GbzztgynaJNAuJqPOLDj2VBdhiSD6bjr+7cAAj1HGy0jtSkaij37AyU9kz
         fA/e11362xD7cxfTnCOQIEH6scRSN9/fXvjH59/jkiy+BXrahjnMcEcH/ACMee5or+Wh
         nakDlXaJ5XEQ7GNCQoNdin2HEq70Y3RVrNhmyrwZVK//gCpUhVQW9kmtO0ZcWv1l7vS4
         xhUFyM05oVdk9lqrfaWzJ3t4inOhLLCxM4syaLpAfNjwdCKv2ksplEIQAD1lDHjc9aTU
         EWBsvtaQbsO/fPUk6ABNhg6Bf2f6fPqswqsMHcT3jiHnpaVFu+c0VEHJ6UyxpTEVMMRR
         GLzw==
X-Gm-Message-State: AOJu0Yya+L7M98jH6fnuLXYHeNioXd18F/oMi50WkEjYMJnW4MbJAEVh
	wWIgcdtJAu/bHK4VStLjdtgN4/5UDyX9YmE84+mBv2qEgGSEeq5yjReWOfNapRcituiSi+OGwOL
	izDhHDT3q4gFcT5yxp58j9uECabJ3BOM6jqfl3g==
X-Google-Smtp-Source: AGHT+IH7/mZBjs2EjvojqcpcvFrKDkqXbLzePQwHXjWI3pjuKzeuKKYp6aDXpqli+cr6MKqGXO43wFaJScoTxBnZMCE=
X-Received: by 2002:ac8:5e51:0:b0:42c:5f0e:6411 with SMTP id
 i17-20020ac85e51000000b0042c5f0e6411mr85445qtx.25.1707505320844; Fri, 09 Feb
 2024 11:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
 <20240207174102.1486130-8-pasha.tatashin@soleen.com> <2718393.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <2718393.mvXUDI8C0e@jernej-laptop>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 9 Feb 2024 14:01:24 -0500
Message-ID: <CA+CK2bBqzd4imzKxGJVUn3SkvDBPk_=CLA1Fm05kz3DqSE2gpA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] iommu/sun50i: use page allocation function
 provided by iommu-pages.h
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jonathanh@nvidia.com, joro@8bytes.org, 
	krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 5:55=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne sreda, 07. februar 2024 ob 18:40:59 CET je Pasha Tatashin napisal(a):
> > Convert iommu/sun50i-iommu.c to use the new page allocation functions
> > provided in iommu-pages.h.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Acked-by: David Rientjes <rientjes@google.com>
> > Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thank you,
Pasha
