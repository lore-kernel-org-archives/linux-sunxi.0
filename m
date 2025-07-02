Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A1223DF0
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Jul 2025 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440912; cv=none; b=WdwjMvQCPKTSvtUR+pOri3AsRpx/y1flgqeQyZnf44WLfCFjsiblg+ifQalHhIRJUgRH/MR73iWa1oqjmeRA1u1YgRbL5fdn8CPSuuLsSOtvrXEn6GFN8TuSXohyeQwufCyjMLxHV5mb4yig8QcSa+pJQdJDytkSliuULFf3mnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440912; c=relaxed/simple;
	bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLkAQsXD7Sf/TTRQe2+Trf7nQcDMOGfs2qDIGEAH+D4ZMoUDjyhd1NOsvgF7GPI0Lg9dqdIO2zRyLzDhdVsG517yFt7kgaBp+Tmuj3GmHmyCtF6xqb5tyDacqIVC0GUBkrhFdBf8Zn/XUh76D/IHgI+rQap3Fw62jIxe8wfezmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6078235e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Jul 2025 00:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440906; x=1752045706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
        b=c2BDKlQIN6t7nt5dyk+Ox/GfmOT8wqRDrhHdCPgxCNH30lU8BukjYJy4iCSkeJDwMC
         IjUL1firWEEvadsOiv1n5iKylRvwexnSF9kxyR9+s5572yNaC2HUK6dtLc52dKj0tcs5
         kMq5YN5AQY0LfkL7p+O20jUALyZg5nU6M5DHPOIc3D3O1Nv89/WIF3oRiJ+ZAhDzhMOt
         q+DV+VyVCy+z4beD1pI62wcMflzYIbMKe8MsQ/u4grOQDSi+XRx8CriZNqnCAXHg4YVr
         6ZoOqf7aEPYNg9LkzR1CAiZZ9Es59XkJr7N8LRlaF+j3HZyl8wyn1SAssLm9+VpuXye+
         b7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYNgS2bEXTQyTE/WIT/vH1WkhdfNoeuGAwv/vujyij27r1AK+VVT2tRjGyqGs0mVs6FO53sEQnXhdiwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcz0VT8RtC9fQXBSl9exvPtrbL6H1rhWHPkR37Hosn4y05hENx
	LE1L1/GiHdRO5QS4B+t2DNON7ATV0aRoV/GlbqweyiuhTiEm9aPkZ2YJ2OqE/Bv0
X-Gm-Gg: ASbGncvKUXoQv/z3PoZVX0kYMHE5etMZlSHfqkGSSgqpw2xe3QyKVqRdHdIpA4QpKYV
	R7ISjN6HkJXBWoFBha9Nm+98JmSRcRSz2RgTPKafRdHXdXETadwyN0BjnIX3e/5p6/Q33P9XpB0
	YbH/oyk0tovhPDfJIi0gqfz6NeN4FUrhpoR0qUV7ChSCermLeukX71unI0SiWgpvPKqKeIQJS2f
	AxnNlFTFHZp5xgP8nYB+jJCtYSXM5olmW8nJu92I+Q5REUeFgqcmnj+vCF4UoKE8EDclz12A/IG
	1QAfKBlJE+/Vw5lC5Lm9Ipvuj+ume1Bj9XNUsqIyIuGvfTGgR52OwOIrsIDQPQaxTCjipmMj8o0
	IU5JgzxL+l2++TwE3Daw=
X-Google-Smtp-Source: AGHT+IFSTKzuHvzHAI/GbgFGUjBTYfsyQyRkKLsNyHtV5yGEiT1dHCpFRJDh8g8WZ+3fd3Q2++BHwA==
X-Received: by 2002:a05:6512:3049:b0:553:2e99:c20 with SMTP id 2adb3069b0e04-5562831e0e1mr664263e87.34.1751440906160;
        Wed, 02 Jul 2025 00:21:46 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b240461sm2039217e87.1.2025.07.02.00.21.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b50f357ecso37474551fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4tsTEjxI8OGWiWZmEzoTKHMdD+egIXRsJHH9AfnxrVInDTDN0LKoRne1xq3eY5zwMB1ERtiFJ0MlXNw==@lists.linux.dev
X-Received: by 2002:a2e:881a:0:b0:32a:6e77:3e57 with SMTP id
 38308e7fff4ca-32e00059701mr5163051fa.21.1751440904870; Wed, 02 Jul 2025
 00:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 15:21:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
X-Gm-Features: Ac12FXzCUNmtlDRkeXVtg02FaWchFlhOllywrVEAHXAtLHX_qmyxYGIEnu1zURg
Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:13=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by Chen-Yu Tsai <wens@csie.org>
