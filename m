Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0880036
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031802; cv=none; b=YVMr3LzUoJ37LcHDfDDyYPvHh7qc3DFy577xWhxYULnMcn8NlQ+Lnqgwon2zfxU1cW8RzhQDFHRl3/W/fWMj2i6sjo8n3Kdpu5pqXB6ebu1YLm0PfgEDdXoTBHAlUryevNmVqKbf+9qMi7M1Mp7zsAwVjDP2Rp/RDA4pQg7CHbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031802; c=relaxed/simple;
	bh=kTxBbsO7xNZINKwTMim0Kh90fmp9yZ6WuJ5NL2lrpH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6YExxNlfvUYD9B8dpFRf31pI3rHA9EE7XlZYB3hrOLF3YfuivrTb4sI/5zLt0nAX/zg7ojWHOykTLwruA/cK7Lw7L7Dp8ehLqG/LjzrGhoiPyqXnKa0cnkIWUfUP+mmsMEsmZBLDsy5y8se4BGo2i4GdVZ4M3xXAecj8eSK3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6HaXXjU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6HaXXjU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so4670767f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031799; x=1706636599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTxBbsO7xNZINKwTMim0Kh90fmp9yZ6WuJ5NL2lrpH8=;
        b=K6HaXXjUiBw0Gu0FI1pCgWDSLDMF61gJjReyEhvT2/p6L3FT25+w40nmWHDrf1oOKT
         v0J7niARQwN+HoxTShcyleA3ZHPw8+hH5AtzvKTs7WgNIFhGEx6AzkLjfyh2tUDO/rMc
         tSr4JXc9tuqmOhZJcm6ySEUS2MRowwi78h8Xme9qN04HG1uzdqX+wBBCARWrg9P7Ax1s
         G4bCY1aTlKwT0gW9m6HHHDfkZU0/6sSNX7ErYMEuxB9wXhX8OtgtLzgt8GeioAsmUWK0
         QxBGV4ath2AOcvLM37IKx8JrdxclFP/RRnqnO37vtDVUy1L1UMmQzxjbYvkjN1L+a7tU
         pa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031799; x=1706636599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTxBbsO7xNZINKwTMim0Kh90fmp9yZ6WuJ5NL2lrpH8=;
        b=ZpiFxyH5muaA6sW5n7/VK3iiPyRFRAX7DjIP4/SxCzVRKSfOm4Nkf86P8/H6hEBd/W
         mckA8vbsKN1P6IQFT7Smfo+H0rJIATGDtGTcH9fPrBho7TvX84aHJH5zigNuql6AMf5v
         PzPOjCE9zxRRqAvqGlkpLd8s7HuGP60gIwjxMIPSq/xxa10HqxV4N5DEXBfBjVx94o05
         e/HX0XwXKm5tNO0fRoNRgFn5kcyD8GxBizyqhKUM6YPSMvOP3AwAYlaOA//G28BS+K/C
         pb//FgxOXvlRZyuygcyEG2TCdmUkTni83YwEztUaZwH+7sB4BcrZGDVzUuXkUTZTn/zR
         8YBw==
X-Gm-Message-State: AOJu0Yxo2+xNFhAtEt195D3lWIGobxMuLTg8OHDXnsYokhLJmTHsmw68
	B9Mt+Et6QHqsifGCwdXgf3k3XLvin2eLJ5lFgWUcBdMqCrL72M07
X-Google-Smtp-Source: AGHT+IEgZPKPFdnWg5569ss0DlAqGEitJtHlNF1gG2/gBSvhOkjYp8Mr7g+2XGWViwxLPVQ1X8/9wA==
X-Received: by 2002:a5d:4f8e:0:b0:337:bb0f:3702 with SMTP id d14-20020a5d4f8e000000b00337bb0f3702mr4120418wru.35.1706031799047;
        Tue, 23 Jan 2024 09:43:19 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d6146000000b003392f625adcsm7148732wrt.36.2024.01.23.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:43:18 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: usb: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 18:43:17 +0100
Message-ID: <2312051.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20240121051858.17647-1-rdunlap@infradead.org>
References: <20240121051858.17647-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. januar 2024 ob 06:18:57 CET je Randy Dunlap napisal(a):
> Move the function description comment to immediately above the
> function implementation, the add function parameter descriptions to
> prevent kernel-doc warnings:
>=20
> clk-usb.c:80: warning: expecting prototype for sunxi_usb_clk_setup(). Pro=
totype was for SUNXI_USB_MAX_SIZE() instead
> clk-usb.c:91: warning: Function parameter or struct member 'node' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'data' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'lock' not des=
cribed in 'sunxi_usb_clk_setup'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Emilio L=F3pez <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


