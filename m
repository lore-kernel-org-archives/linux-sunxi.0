Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75F23185D
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Oct 2025 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761458386; cv=none; b=nvF+P27J3Q3hgsccOasdmaBaQAiqppYI3W/y3X2ZnPf10YVMy+27sWhyuLI7xvAUdu5esh17Mn7xUiXISFjC3HbLHUA49M0mPftmpd4kL22hAP9cVdjYuazpLGpK1mT2Bk5fBvVR+AHgzvSH5bv1Q8MtWyhNP2bGFyDONgHfXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761458386; c=relaxed/simple;
	bh=A6NZo4xjZn6VpoDmgTXQPGhDEhgFnksDmFJRaagzP1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZezSqOyUmqbkfEA0Oew5U5uRfMd5o8mPTsS4y794/FYznVJrXIS5HwPrK6Cg2fWaKZMk1N50HjSdT7cMjaSpyzMuG+f8/f6QVv47dM2Yb4ZrcPyoVvizwSTLkaL2qnDlhDIFb/FYc/HTWUxkWKAJJkrExCiZJBL2PHu3l0sSUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN4iPhxd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN4iPhxd"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4539dddd99so745161966b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 25 Oct 2025 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761458383; x=1762063183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6NZo4xjZn6VpoDmgTXQPGhDEhgFnksDmFJRaagzP1w=;
        b=cN4iPhxd9oEM/FiWqF4qSCimx+XNfkA34lEtwPPlyGpkZwnuyrpVXRUdTaj6ssae7W
         V/eqCsdhcn4Ph6/7pkFeqRqgSUZfP6i64KeVfyl0MuAiTehI4YwHEB5QalDr8+l4Qtwf
         RyUBHxSMTD956GqWaXs5nN/6NelZOdxlq+ocUZBTnmT/22AA3NyNrjCgFRmwNX5gsfSz
         E5Qs0jjtEhzrbb1XZlFcEisaT8MRU8t2tsi1uXRfVHGHOxk3qZQavt6A+4/6Qf8nhguq
         hSWxKnIOhUGPNyhD5DTwn3akEhE/M4AZkKPBG4mDc57uwcpnO3GOkdkoTtgtygmN1lfG
         wxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761458383; x=1762063183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6NZo4xjZn6VpoDmgTXQPGhDEhgFnksDmFJRaagzP1w=;
        b=bmU4Qxdc3N/dWAp8CEAh0yKklvR9SbVua8NlhFEUb+M142mxRLYb986sOaz3gWQNpL
         tXPesK1ARDBE2AkLnCTq2TyTmZeKfLvEILx7PXIxbKYBG4KOxCV+EiDvsQqX4LkKQu5k
         NiHHopH/VI1oyOGIC7TWMHd4DZDfugvL8nJyerW/cH0i4Y2iG+6A4O0LCx/RHHlErRwG
         NTulJh35v9IgHZR8CB0rEbyQQMENWA0Kps78+g0a/6oA5TwNn9UGc6hJO72wRJaaHa/0
         zTG6EXPk+DG4yJJoriA0fmX8gsXmfY+uU2rzybGQGW/Y/5Hh6ZFCJpZNkL0//0jmyYZD
         gnYw==
X-Gm-Message-State: AOJu0YyZbL5ev94vzuYP18tRbqzZRE++Tqr4cVatRuwcGG3+Fwc1nel+
	xd75fe159rJxzl94lv9HW9cD0M1F+m0bV8fe4hWTZ9oHfm22p9GJrdD/
X-Gm-Gg: ASbGnctixP1lGsR4cLZ2w1wrV41/xlKhAPSKj5g7R6MEw3ipgyrWmna37zmtySEguTb
	HNvA5PRKes4kMLc/1Oux6OI82X9k6sqtrR7mj2NzLZIAjtDfZ/bR0DuFtpKh/da8/E8JW9k7KHu
	F0fMkikKeRDmO1HeS2fL1I288L81BSTr+och4y6+8b018m0cL2kXXZGIlma/PBZShZMqeGvJzvf
	H2QZwmsqRk7QxWFtWIwZTKdADHCslOZTcIZpiFUIbtSJVwuJGTokCpyL6XGbKdWJfUoIqr22awA
	JIY2Joz3MYzS78dy6x1xL83iE5zMkD6xrL9qzoQds9yYVcnn8U2nKYnXZY0CGw51IxHh3XyKfOG
	eYFDeqxNxImzxVuN8gc6wFrcI+lOuS5+c3304rX4YFwEwrndGAU8ad3KjKsTNKwXQ1mbqfNq48k
	CeMeP+Ii4LVYf4m/cIU2n2xQ==
X-Google-Smtp-Source: AGHT+IHskUzJ+v07K8gkLP0h32BSIFq0ZCZoEpPqqhZkGYDv/82+sS9TmsErXWD82UWmubewSnK+BA==
X-Received: by 2002:a17:907:9415:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b6d51aeff5bmr1340800466b.3.1761458383172;
        Sat, 25 Oct 2025 22:59:43 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c82sm381232466b.5.2025.10.25.22.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 22:59:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 1/4] sunxi: switch the Allwinner T113 SoC to OF_UPSTREAM
Date: Sun, 26 Oct 2025 06:59:41 +0100
Message-ID: <2801929.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251026012357.16773-2-andre.przywara@arm.com>
References:
 <20251026012357.16773-1-andre.przywara@arm.com>
 <20251026012357.16773-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 26. oktober 2025 ob 02:23:53 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> In contrast to some other Allwinner SoCs, there is no difference between
> the DTs for the Allwinner T113-s3 SoC (sun20i) between the U-Boot and the
> Linux kernel repository.
>=20
> Remove the old copies of the T113-s3 related .dts and .dtsi files, and
> switch the whole SoC (represented by just one board) over to use
> OF_UPSTREAM.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

While I haven't actually compared files, those weren't changed for some
time now. It makes sense to switch them over:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


