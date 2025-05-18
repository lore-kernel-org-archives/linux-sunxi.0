Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3F487A5
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586734; cv=none; b=DVXdnZhLRRKhqDwe5GfKx289ST/0f2pY03ag0UUWQtPgJ8Rb6IA7KmvunoJ9QdMaw4c2HPERCPz92pABIfAgft9i8aV/IZSqlctq0zQDe5wlGHJ4WreFa8kPFIOZugIvQqK1Q9gQL0QnXy+HtmD4wS6ISoQxEbKaM7aBcdwjDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586734; c=relaxed/simple;
	bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmVsSc/LDg2jvJLMw7WMUKu6+GYtvN/zDokGrXRJ0tCIUtdzC8Aj27JvCR7EFG+3+zezuKIOGGsCnJR/qOBpP/NwPle+NwYjaUuR8rcgTT81qH4I8wGf3RldWsOjq7CpYgmCZrn5+b+j8R9h3M+FgCzcBNp/XfFYI5eFmmUvRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86192b6946eso97775139f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586728; x=1748191528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
        b=h+8B19/yeLB3gwJd84NPP7V7UDstaOpbT4GfhoatZ8SPzOzY9QUCKeexyRPaIP3PXP
         9UDx8rokUkS3+0RBB4/sUNLv5g0Fuyu36aCSkNvNq3M7SP55+vCC9JrogAb0Dg5IZfrq
         ovPIUxJ5z5oXlP/+z/k8m8mcQlqcv44yE/cqYYFRqRBMYUOA7V2gjWqLzsQbctBrTasC
         hZa7fTjNxXgtUIoQZfer4RX2+txZFx83q2+YlvReIdBgMNu1D1ZaRQ01BYLDSR0y5iM1
         tUgKiHcm7GXkgC8QhLs2v1QuFZD11Y/wa61w/gF/+CHk4d/fNGfubBVtoZUkXFmnHfgN
         g+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Rk1RIWYXlISPPW9ej9l3hjfGdCyVZx2PAK2fnNp2O8S2bJ45W7BPKoKhJQh1fBUDm0RieJsGfzmgRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNoDPlitHxnvGvZV7VKw5H0bxy9e3lmhJeVWVoJcXAfCTUgEDO
	E5mVjbhH85yrqCyILmEQpSer1XbpYg+TXCY4kZ5AB0jRqI1OOVokmWHDnzoSHOxk3tY=
X-Gm-Gg: ASbGncsiYPqUHOAOBPxu3Vk/DSXpggbr/X9Zt38eEtGuVhwAgU5A+KBBDju65jNP55g
	qkVZ/GrvsJtSNR9VoYGmSkEqJwLtytMHniFu/SVmzbgimBnbR+xHY2eEBiwaLTGLcTevkudGRuF
	DP8Axiq2L/w8Ow26PAm0YhseB2VHGT4Kafx2wM1tDuWC0evLfxE4dI0EQ3hYxBoycKtydEOOSjz
	shBwxMVoPdxhY5l6/jMa+/7oaH2RbUYTbLbd6AZT7CWhMo8zJ2hkRB1TXpxx1YSaOxI+XRV7KTP
	TRL0/5QeDk6N6G0dfEvIiVdKON/svj6uKYvcm78kdS4SUsaf0rlhyLVbexiCXwn8INU8sao/E3b
	tvIcOz/o1
X-Google-Smtp-Source: AGHT+IFhOo4kLKIF6POHE0ntgE1T5GN+L7zHs7p7w7Nksslq6VvZ94Ri0QphShZRVT1iAGJJahK44g==
X-Received: by 2002:a05:6602:7510:b0:864:48ec:c312 with SMTP id ca18e2360f4ac-86a24bbb4f6mr1085939539f.3.1747586728058;
        Sun, 18 May 2025 09:45:28 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ae126sm1345851173.37.2025.05.18.09.45.26
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:45:26 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3dc6b2a8647so1491355ab.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYCAHplQQWYn0f9kGu8JbhJ5v6/J0lQivnZz9/7/Gxy2p9J7pZ7Tk1Vn8XYSjgQDQNOydLqrZVL/jkFQ==@lists.linux.dev
X-Received: by 2002:a05:6e02:351d:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3db857b6555mr99202655ab.19.1747586726194; Sun, 18 May 2025
 09:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:45:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
X-Gm-Features: AX0GCFslyTJW3_SklNq3JULGeTuerD-gifQjm7kfUwjIWTbHbiDIUF58cpuqmoU
Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Code looks OK, though I have not tried to check the register offsets.
