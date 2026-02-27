Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817D3233E8
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207046; cv=none; b=D8JF+BM6w1i+gKModNHM7D1Ssq4+XsGFcSNLKQ4ljCxzBFt21LSulqYF9L8L5kUYqlMacEQFDXSu+2+oufNHyl+vb/JeCrHDUJnnsypCqZt3KdNJAGfkaZsRExJ53e4dloXHTcAQCCIHigpAgVzrkiqmUFYWnfbRB+Li3WfAPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207046; c=relaxed/simple;
	bh=Y8K1WqT2zQyAQVmCsqmYitEbawYInl77Bk8Qa9Pj31s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Beq04VrpGH0vCQAdmGY4nSRfH/oOy8HuBR5+3kGzuVdJRtJ6Whf1hJW6QXSN1nUuV+9C8kahjkzT4sreWMmEu2/Qpvry1b7uQnMjXDPqto2D1TtZYyMZ35KeGR4wWFVvTjsLK63Q20JCUlOebZP3OqPVxD4SbkQojxabB/tQzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+5zj1ZG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+5zj1ZG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ada721eda1so10054565ad.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207044; x=1772811844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pNuEW5DadTME76c1H2/bOIre54Jrgk8HxKShAN/0Jg=;
        b=S+5zj1ZGaObwWi9PMV0l9WD6+8PjlapmYXC9HbzrfcRt4Y2OQi+US1cGaJoAHBOPMt
         mwsPPM2SvI0epUycrVyOcw+7+XG9iuUcMSj8GBzPQCxBhcJEivpph6ylQHbdtnM/b6d8
         x1HE4z6f55knb9NNvHIjbfT3Vr0BJAjd4ykhnRNJasM0KM7SaINqRtwuQ7DCL6jmP6uV
         zfrfsbXXTAY7QQ5gY5G9MvNWzkxu32YZsaQcZ1iYtTZ5Nm3pU/ScvAyEMsm1MeQKamju
         sZDCRrUTztUgqRgALMcgasACeyKF56ygMr01uxnR08GAOP9qeLLrwDGDxufnnSHT3y0S
         1FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207044; x=1772811844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0pNuEW5DadTME76c1H2/bOIre54Jrgk8HxKShAN/0Jg=;
        b=bovP+0hl2ZVse57I2Sqx0z9zgu3eZyww+9xcvBtqpCTr4ShmrSNX1tZ6WR0lMeechC
         9ECVIu6Lvgev2wWifE3TxNmHsZhojoTU+tOBPMMxEckcJCUr8D3o4ROzThFEmtlFWx6N
         wU349ut2zGjRJ1TFRNf3ILJPsyGAiY/xmqQtEWmwYD3LpXp+rM+3V4i8NiXPBy9ShJSn
         FOs5F3q25Kyjlc8AYOo3MFWZrv3qBltWj627yslkZcgV1bDhJAh7W6msv1l6Es4xsojR
         7e9uQgWxbnZuJauIWeXXTmq1nlAnLm6tVOMBXkLRN8Lo+Qdh263IOSso7aN+RyXvK5Fz
         7vRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbhZCSOvGOvIj7mNHzF9A7ckrj8oaxem7P3IZLRmSnMLAdOoKG1Vgt+JZQgGkThnpiP9QKRo+0fHGlSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2S1RfufqmJUqTychtBkCpAAoxgrGD5I2++VLHO9TIWqsf8c4G
	OCwc9sQpIWBCisauJDuzVKDEepMvwWmmQ9wDyh6YYdI/OTeRIc5/5Cs5
X-Gm-Gg: ATEYQzy3glESqLmtLChOxGKztQfxM3aNbAggueSoJcUcxOh/EdJ3H4PADXr7MSVd6Z+
	4iECoPBl8I7xAHmLfHmTLiEqbaHfnBWOiWOmzq0hZUAcXESlOLrULwlEU1KlR4C7N8Ifv0uRN2z
	R4RPjXVxEGuCrvQBzLltpR5HzgXmxGCuAiVX7Jrg02eH2PKO+6ql5mWEWIVXGTaSuoGOrodbEGD
	4KXHKiO3oqFbSyX76+6giGaXEsaiVXCCP24cFdNhZy5tflJPrXjYw+rO5dxy+P4wGwC7FXKtSSH
	jyxMPkS77fDqBtUlagxvP2L/YEFXJl8jL1QGieEGnSK/dd0jYYU0e7wgfmHy+GaGQAt6OqQquHv
	oDiTSxzJ9xlJjXYCQ748DHny1qtRScWg07g5hwvXCK7njOnINYMefWYndf826RVrfZXdOdgugQd
	xXRZ4Xh3D6ucC4CgwEyikWaGTfDKf/7Kn/GIiV
X-Received: by 2002:a17:903:2312:b0:2ad:ca65:a37b with SMTP id d9443c01a7336-2ae2e4d981bmr25603655ad.51.1772207044308;
        Fri, 27 Feb 2026 07:44:04 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b5813sm60314305ad.63.2026.02.27.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:44:04 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:43:58 +0800
Message-ID: <20260227154358.206060-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-placid-rare-markhor-cfbdb6@quoll>
References: <20260227-placid-rare-markhor-cfbdb6@quoll>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Thu, Feb 26, 2026 at 11:27:02PM +0800, Jun Yan wrote:
> > > On 26/02/2026 09:48, Jun Yan wrote:
> > > > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > > > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > > > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > > > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > > > infrared input.
> > > > 
> > > > It was released by UQsoft as a blockchain-based terminal and is
> > > > now discontinued and no longer supported.
> > > > 
> > > >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> > > 
> > > This name and footer at that page suggests name "ultrapower" not "uqsoft".
> > UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
> > Ultrapower (Beijing Ultrapower Software Co., Ltd.).
> > 
> > TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
> > official website[2].
> > 
> > It should be noted that UQSoft's official website is no longer operational, and the 
> > company is seemingly discontinued.
> > 
> > Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
> > if this is acceptable to you.
> 
> Yes, please use ultrapower in such case. You can mention all this in the
> vendor-prefix patch.
This will be adjusted in the patch V2.

Best regrads,
Jun Yan
> 
> Best regards,
> Krzysztof


