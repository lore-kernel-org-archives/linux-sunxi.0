Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67EEAC7
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751822033; cv=none; b=GzuK88mflOqTjQhWGqZYxiTNZp0MgST599GBWI5oWzHPzIpFRJeGSJnSCgeZHhd/bCdNK/EFIJnBh7RTA9KiFuuuCPqmp1BdjJU2sWTYusBUZppJMxY/4g7yfj2NAjZO3LexBj6LwsS1CIq+zRn0fMUeoS5qUORg8O+5BsZBk4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751822033; c=relaxed/simple;
	bh=xntmh5L/t1M0BbaxBvySuQJ4cfMmgjmGufu3g9VVg/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhDVQUgfN95NraPDsBsFJP7CYU0xRsSQDw7UowHsT4o+uJf6MGQ4YozaqNdUlfWiAAlWSBfJq+nBHFlDEgeMzLCkRIwlYhVJrzhgLgNZoLCYY4At+/RE4tkQwF/qLxhY9AIjtKXCXitaGOX/PQahbzzVpMjMnSWmNasJR92813U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b561a861fso20285661fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 10:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822027; x=1752426827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xntmh5L/t1M0BbaxBvySuQJ4cfMmgjmGufu3g9VVg/I=;
        b=nAgH/FuKyHP8bUcUwT0oeC2qNFWy+JVTCjy/O5pT/I0vgCmYXshJh4fB+bnandbcOl
         cCM3hG/GBKKs+Mr6VYTl7KrCkNTFJszeiMrD7m29gcCIZ5dL5V8eQYHnyHa2amE/NeWS
         8z/XnZ9eIn1kl4iNHIAxokKazZIO8FEsA6Upa61+2rhGlWoeCXS57Gf+mPjMkKBRFp/y
         TEh4doLgkjqsNKt3QMnidImpuI12PiHJJF7ls0ZGtCGc1Rk7bKyGehVc+R7VMLmd0On8
         hQ5JMUpLiJnFk4AvMzU6ovGycv5WscnXfL8FfZCEesnOg8eaD8waY3F8gScxxrik2pn/
         ucog==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2Y+Ze4CNV9MGz0CwvEJNonhgvPZsdqkEYTCBm6fOWDyH7iMWN8Q5kCG/YFOK+0ZrmMrR0UA0L4eADw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx01zKzHQyJOVcZWnlhz5kQEQiFFuQBKHLSUt3VvCJjhHRA/sW9
	DVnPH+tT2eJc8BL7atonQM/ifVMOR35I5AICHIdn8RHAXV8ofWtniLnHAS/dsVMzmMA=
X-Gm-Gg: ASbGncsTDxdFG3Ep44lTbgqUkTrXoGYbZIEU8buw7YXGGw5jjh14aUdeSPYUdzCE3Rm
	ksjWldxrZkfRHIYYv3cdsrIFfviwG3l/FtvriLj2d4H3ZQedhSacWziCW6hInqO3bhuorj/hAXg
	KR1gu+lo22MWK5kBeDihlaOGNpG7YMqn0X4OCm/B4IOpAOWAdKp6nMBlogCTubs567swqs+71+B
	gGnn8QVA9uehnfaX31XPe4QXZHiIACOlnnkS3Dox0hyamq+DpTe+mGibK5bO0oenqjgquDzxSoo
	41nj8Nya13zUg+UOzmn8Vh6BiN8Vn9AxuaW71uFy9wPSvp3pkJUQLhCh22dDTMehNb+aEpKk5XM
	m80vL/M2Gvur33g9mOO8=
X-Google-Smtp-Source: AGHT+IFSUK0llmOOzZtp/G+Vs1mtMTKoV5mVOgIn0xa7eKQslLjZZqPHLLwcuxITVt0IZ13WaPBrFA==
X-Received: by 2002:a05:6512:1051:b0:553:cfa8:dd38 with SMTP id 2adb3069b0e04-557e558b727mr1555094e87.36.1751822026694;
        Sun, 06 Jul 2025 10:13:46 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d16c7sm1019165e87.253.2025.07.06.10.13.46
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 10:13:46 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b5931037eso19340861fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jul 2025 10:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7XUIkkQBlmllvTzQnsPuLIToNURtsCIMsHB0FG3vfrPPqb8tBGWJXRSXK6StDq4jL8yn/YBUv6tYhnw==@lists.linux.dev
X-Received: by 2002:a05:6512:4006:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-557e55a492fmr1336495e87.52.1751822025791; Sun, 06 Jul 2025
 10:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250703151132.2642378-1-iuncuim@gmail.com> <20250703151132.2642378-5-iuncuim@gmail.com>
In-Reply-To: <20250703151132.2642378-5-iuncuim@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 01:13:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v64_Qib8ZOJAV4YM0i+iWZUdNiKyMCjXPB-MkgFJ3T3qYA@mail.gmail.com>
X-Gm-Features: Ac12FXyldBjty2mm-UwbDbRGBw3sjMptAz34h6GSxjv76j_NWWYkZYXpbLYbm4U
Message-ID: <CAGb2v64_Qib8ZOJAV4YM0i+iWZUdNiKyMCjXPB-MkgFJ3T3qYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] thermal/drivers/sun8i: replace devm_reset_control_get
 to devm_reset_control_get_shared_deasserted
To: iuncuim <iuncuim@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:13=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, but they share a comm=
on
> reset line. We can to use devm_reset_control_get_shared_deasserted() inst=
ead
> of devm_reset_control_get(). This will simplify the driver.

Nit: I'd probably write:

Make it shared with the shared variant of devm_reset_control_get(), and als=
o
simplify the driver by switching to devm_reset_control_get_shared_deasserte=
d().

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
