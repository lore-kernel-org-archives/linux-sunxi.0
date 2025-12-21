Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB882FE071
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331817; cv=none; b=o1qkbzTb8Oqv6iTWPsh/+h88iJjJ97szJfyL13UZ6/T7ppPGtH/SxdNVoZO+GNdthenzrHMLpDyxZ6FcKKmXWnMHPru07exLl2ixzujdqKEIOt1WSxpjfiRqvw0ZVY7Pvvhsq9vlNLvk91xH8s4NTrB9OIiqbgc4OgXxOXDRxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331817; c=relaxed/simple;
	bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6EJR8VLHUuq7C0AC0vAeX6N/x+RKeV/sy494jWotKcWYN5E2snqLFVXLk42Grf1lHLOCyUt4hI3/j1+7TbUSngiySgzcKy/bk4yZT/x1yQDTpLbcBFOHbe7lkFShNOEYxQZwAlNfZHwQJijQx8wNTrYwSrRv5uu2Gfg6AOT+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNxjrPSi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNxjrPSi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so32713555e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766331814; x=1766936614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
        b=LNxjrPSiM+lrIYVA/5R9Ateeg3HCnxlAXErw07KLTJV0H+x0wC9RlzdjYAugIJJipg
         wiKeCcK/7ocyf1KbD2pLKY89twv1Su7S19EJ4wgGZeiBHDZQJZ1WnECqhP0ctmtVKVeF
         uxoUJaEnBNDf7O5z+o/IqY8sk5WIYLZJQuyzJpYeqhq4rn5TArEL/Bpdc101/XiZm/FK
         81YJF0w5PcVlyxOqRXqBau5IH4WSaXZKSbTgIZJWU3GpJ3QcdKJMxj3uNJvAmcsHRCRC
         AfmSkXbowO/KUrsGw/pmITwxAH77X15O73D9//CEBxnyH/MkTZD9TwC9NQxRzCvU1W4S
         g9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766331814; x=1766936614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WxwGrpNZyE2bILo3nziy8OGBze7BsbY7wJTGjfc0II=;
        b=aKDhsLDk46j/iJn2K3TODNbNcZxm+NhHZV1zpM9H8P6hDHfwHioncqncD+RlO1oFGH
         ze5eT3IjylkrCAwU+d7XmKRiT4zMKu6gcvYcyJek8BU8qgKxIkfA63eNAK/xXDlAeJre
         B7pIKn8ub3e2+fcVQM0p1FM+oGhNOdpXx/9SDVYV6GUQOj3c0Qo6hT5QK7k1Fweg+VZI
         o1ZES9tEXUoU2N2bvrzfZNJMsJg4N2jSE+xWUX697niPKTu5qsPS2Zeqa/cl/ZzbMx45
         EbD3Fk8S3+Zb1BDcorYyae1Eblcv6D8YRsAGVRorqvCaRe5uM1AJHpXKJtVu+OSklr+a
         RmsQ==
X-Gm-Message-State: AOJu0Yzn7hmlNEH7b8VX2AGo0K2WajmiNkDRNUk3qZoCndO2yqSXtXXW
	j0iJuI/TSCmor96LX6OOoLdyLuDWixYvhwvFegDUd8ss3TXKyptkDi6E
X-Gm-Gg: AY/fxX5bBDNL2UmvnMRKrzS5ZqWEYiaAw7H+lA5tS2Su4q7T4ZYn8yHNwRzDpXwiaR8
	FqPc9J4lyI+C/PC8HVEiJKL7iToQr2vaUyVSy2IZ22pEsu6jc7YsQ/480Zijq33s2UZyDn/Q6la
	7wixcumTNfSkEBrE3EbDVcy/9p2nwwzgAGu4C8b68nveUY1ErbHAhMaWqqVYgB/zmuuTKaPJC2s
	/wNb+ryFBdn+NHaL+6VK4JvKjCEn8qrVRqiZSqWKx3EKcmBIdRoVNHUmNareMO8FKEeWm2hqnGt
	HuA7m9kEOJ2UPOjxTUz/2JExKNjQWz6Ezy5xwGDNgavM7MExQpZ54Lbwg8OSrb4qdR3IvWe1Xkj
	xEG+Gmw6O5+og62Sa3ISxeRWv1b3c5f+/G+UrjbxojtQ+LR5rHpxoC0nICQmW7U3BcDwL5jX759
	mU+42MKgvp4vNX49knRFFpWrqvA6Ws9vSZAp2RvSwneSfggXSALbZ/9Ft07En8WN3ZvlvWQlmkX
	Z49TZ8=
X-Google-Smtp-Source: AGHT+IEBwnFXhESimii2eoD13Ic6GAaM5NuA2NKdA4x0hOMlJfw0tViVHDvLpEGwUQjvuTV+/VBLXA==
X-Received: by 2002:a05:600c:c0d2:20b0:47d:264e:b371 with SMTP id 5b1f17b1804b1-47d264eb6b0mr27356325e9.18.1766331813700;
        Sun, 21 Dec 2025 07:43:33 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm198475265e9.14.2025.12.21.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:43:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject:
 Re: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for
 sun4i_spdif_quirks
Date: Sun, 21 Dec 2025 16:43:32 +0100
Message-ID: <5062608.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251221035715.1722584-1-wens@kernel.org>
References: <20251221035715.1722584-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 04:57:13 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
> the structure was not expanded to match. This ends up causing a warning
> when the documents are built.
>=20
> Add the missing fields.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202503060947.QKUUR62l-lkp@i=
ntel.com/
> Fixes: 0a2319308de8 ("ASoC: sun4i-spdif: Add clock multiplier settings")
> Fixes: 4a5ac6cd05a7 ("ASoC: sun4i-spdif: Support SPDIF output on A523 fam=
ily")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


