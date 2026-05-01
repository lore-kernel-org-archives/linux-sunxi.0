Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1534E771
	for <linux-sunxi@lists.linux.dev>; Fri,  1 May 2026 23:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679474; cv=none; b=GkE+k5yIyFicMO9h/XSEBPt2YZdFDSHz6iwtBFtKcFlHtz0q2mNYiyBOaHrLXZtdfgkJ7F1pMhXaZwBDsHVzdWLcFDswzvVQ98/kU6H35qn1imLkAfKH5ce2MJRaAF55uToh9JBf6nX8P9JSJIeQHfKg+CayJZKc2xjzIxuvG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679474; c=relaxed/simple;
	bh=bmiUnESHbspiU5uBaWQJmGXMVyqQGS2ygh1Bw1t/9hE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iWyENWHVvxqRwSzXfA8AAw20s7T/AWU3DFxGOgEpNuOVq60QeQpX3EHt8le/zdM/i+KRpw1qXxyvI2Xnn0RdtUR9B5JaahvKa7eTpaSUN05MfqE5LzN5YErle7jjuaEkGpmdtWp+ZRdhIlBzpfq1YfNOsIlmwdRkULFcayAYvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Q6NHjwX4; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Q6NHjwX4"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbca22dbfeso1352945a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 01 May 2026 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777679472; x=1778284272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB11rjFTRDxeBUbbf4pH4F63C/vjjo2WpbSHuZAYH3Y=;
        b=Q6NHjwX4qdwBbZs83yWPr188i/u8RPDSgNAr2I/OQ2nM9QTG/G0jvimcc9b7wTjvmk
         nWqXmfgD9MNnlG2dfOMFDNu3F48+H4jH1sZwOpTp+Pkyb1JIKiQKB2dum/6CvJB1+IeT
         Pv13NbAldlwrUz4kXDV/8hJwOQHDx7BXDpxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777679472; x=1778284272;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TB11rjFTRDxeBUbbf4pH4F63C/vjjo2WpbSHuZAYH3Y=;
        b=Y985URdixf2v0gtt2BKu2EYUo9zLdt3or8uAkI4BT7MSCUHWUnhxjGIZ4EHjivTLkE
         ThQlq4EoSgkawbBJ1niWHGg9iVTLY6hVZ9TViHkX+SMD6cmXvu2zoIohr+99S0qw8QX9
         16n8gRKlY1ITgVaCBF7BGP61O696KvA7YgGv1znFCj23uWowSAID/73W37rL3hYxujsP
         GxV8iBm1BR5V5R5RxS4kAWX5bJf5SLOYoyW6feCyGLczKeCRogK6UvGncZLbiXiTvmk8
         YR2Xe5fJd5dC8Ow/O/FBuYLUGJ3Er5fsw1Z11hIDXMM0RrTaL3fE7GPPO1yZYEQPzecC
         FlWg==
X-Forwarded-Encrypted: i=1; AFNElJ/LjNMoCZUsKkjg9G/ZC9cn01B7xsmf8zNVw59CesnjucEjIyj+v1kL4rDqZo0DuDa/0obqa9iqr1Um8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE+JPp4pvAX0GVNtMbK9MOa3vyIxcztgJ3rZM79TkXNAV9J2m0
	SY2RguhgW4vIosfVC9vVJEi+5e6NKkLZmwNL+CVvN37GGZ0+4yf7oVBUXI5jND+RIbTbLaKYZ6n
	iUJcoizHeK/IM
X-Gm-Gg: AeBDieuRDH420Yxc3XnENpp1OB+9aw/1+67UvU0Jon9V9X6mRZd3mERKwg8rShCOHKl
	bCPv1gnU4qZEZxOhE2JyFaJZoK8h4S1C7hIrkiNh89hMcvQ1v2cDhpzz4LTLVN640N7z0dG/iFW
	172zRUaOpBgW3piBTbES0bZ2196wXpzQRY0Me8IZ9l9J3GyWYuJ8qMNXY69/pAcX8vgisFEiSog
	RmAlRxGa9lOFOCt4NT+J5Wo4688mhaTiiE1Qid1SLU75t7p02UA3r2YTdfTdSkFJ7Kzp5GS+lhL
	AwlSa1W3wBaYlCrn8qMW5XzVmPom5Fl7rpZNrAL/qfLtE5vTCbzHYbov3aAOE6kvjDxSYT640WE
	WjVgL4K/k0xwMB9eVhlzd+30B9hgj9x6ygNZCSda+m1vFkElknEF1SipRpkwjYQ8WETD38bcN6N
	j6C3WYYd3cTkLjqYNTbHkmWaN/XfdOZFRQdBfasppUp5tXL9CP8n9Q7PoSUROFwG76Z4L7SoUc4
	dxEvwPmgH87pt2Yb3Sn06HGHG+iEKjcze2OahSP1zVdL1z7vII2qL9WZXpR
X-Received: by 2002:a05:6830:3c08:b0:7de:44a5:51ea with SMTP id 46e09a7af769-7dee121de03mr864816a34.6.1777679472500;
        Fri, 01 May 2026 16:51:12 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-106-235.totalplay.net. [189.203.106.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ded51a9612sm1967949a34.26.2026.05.01.16.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 16:51:12 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
 Lukas Schmid <lukas.schmid@netcube.li>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
In-Reply-To: <20260501135917.9276-1-andre.przywara@arm.com>
References: <20260501135917.9276-1-andre.przywara@arm.com>
Subject: Re: [GIT PULL] u-boot-sunxi/master for v2026.07
Message-Id: <177767947137.2064724.7106308396690525541.b4-ty@konsulko.com>
Date: Fri, 01 May 2026 17:51:11 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Fri, 1 May 2026 15:59:17 +0200, Andre Przywara wrote:

> apologies for the delay, but please pull those sunxi changes into
> v2026.07. Nothing earth shattering, mostly minor improvements like
> better SPL power LED support, and fixes to some H616 DRAM setup. Also
> some more forward looking enhancement for the SPI code. I also pulled in
> Richard's raw NAND flash improvements for the H6/H616 SoC, though this
> lacks proper peer testing due to the lack of mainline support for any board
> actually employing those chips.
> 
> [...]

Merged into u-boot/master, thanks!

-- 
Tom


