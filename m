Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B32CCC0
	for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747585283; cv=none; b=RbpKs1hcR705XuQ3AUn2UfEVfCgzdBDV2uWc67o3jjt+I1xSGPdUDXpUBQOKinJZMfzgYXtIwuUK0Q9mO0KbaRyV0n/4ekcgJmD6CXu41QSisWB3VfP9GgcyQk4nP4g/54afNsm2//VbsdnIjsEDiq8p4YjUwTCGrWximNtYUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747585283; c=relaxed/simple;
	bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekcY6jRMQumgH27Hyh5gSoIQOKnv/la66cokgXefEEWdKcRQ8wJuCskflbuSgVeqJhmwlmMT5G6ULwiQw6xpqvkTu15W88J41bIzp5lIqD9GNDNMSNkTjTRXzezv8cWkp/cViX2XFToodL3ZQKFmS3v80TXVnB2GVaVQe8+ev6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54298ec925bso5393233e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747585278; x=1748190078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
        b=r3qrmYCWU+CnDfF/5LJHBBPLgi8LiR9xjrKQx6gK6GC2A39xOuUWaT3vGkMR9Cf2ef
         TtSxNxBe7tAfrBt8Ys61lwmCcO3aozqiAME7V/5HcYJ3OwbMmoJdoJYfNurxcnDdS8iU
         x2mEZEgxU85JgnT7Eg6AGslk3AZWZArduCDDpNdrf3BFbOEdQl9pbZEFVjhQm07QpMcz
         b5u1IuFaJF2jmr1Q6zCf4fDGh6t1j9fNPIzbvMBLE3nrRjIUu1C4qieBuVNCV89WbQbZ
         aXCL1bShvIDBbm5K1ZofaPMjGDD4aEZPBTGLw4UYtDS2bBl9h+wn1fnviZ7tLMgdip8r
         8NFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFFnXH1JFsFYhQCKgqUdJ89y4q4U6es3uY1XRV591rsihmCnYUpFw2b5qrJd/joCsmqAKA70meettjiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmatNTsnVttJtv6LsZc20B4ckBECmgsu61uQUTxXdv3LalUz06
	19g1WaDo9frm64BwlbSi8f0GlTwiMYcpTXcwEKWU0VK2BrVYz33NbUAhgbGCFptf
X-Gm-Gg: ASbGncvrN/0+u5Ue4Czzq4jq4WBOpnGuLX4sT0ijvhQ0he0qAyNV8A6exeILqQs5+Im
	5XnWdhI8KgBEcwhj00BoQbHbiGnUOF8mtBjb5i/HmZraaPs0RlWb69On8W4RWqOwiBY5EEU7sZO
	EvQfLtO+b9bMPlRjj1kWOstZioFIscu5fW6c+y5CNeRXea6pHjLQ/QZBOXtp6xc0SWK0ki65sSf
	L72KkIuDF8e2RBO9ig8oJ1RWi9jqYSJnQW8fjOkXPGvLVLsJt6r+1Jfap5UoTeCB9FnpbzK2deI
	+RdqntmEuU9nGVXojADKsAlw2YDOfrNX+FP5peRoRjbTPA+0/3hHgpTHSODc4gnTzYGWCmu2b6B
	8Kt1NB0w6
X-Google-Smtp-Source: AGHT+IH3TqGR0suJ0HY5sCpX6Uvqbnya7TC8Fa1rWv7OUkT1uJpXdMJ2b8NLHatCeLMWSUaR7DC5MQ==
X-Received: by 2002:a05:6512:290f:b0:549:43f8:824 with SMTP id 2adb3069b0e04-550e71d0b48mr2532032e87.26.1747585277634;
        Sun, 18 May 2025 09:21:17 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e8be810dsm1413843e87.157.2025.05.18.09.21.16
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:21:17 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32911d04ff7so5864571fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 May 2025 09:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfP55dlJWCRDRkSpMSUSjbzyNAzV1svesdiM9PL4b9+HUkJjU5SgYpLYCP/YCPX63qnRrFBIsfoffzpw==@lists.linux.dev
X-Received: by 2002:a2e:8a9c:0:b0:30d:7c85:14f5 with SMTP id
 38308e7fff4ca-328077a2e48mr31714831fa.25.1747585276327; Sun, 18 May 2025
 09:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-2-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-2-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
X-Gm-Features: AX0GCFuJznDa_ICl2sGWtQLsZH04UWSn1aHqHteb8YSDT7ZfJxBtky01EaefvaI
Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] drm: sun4i: de2/de3: add mixer version enum
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
>
> Convert the boolean flag to an enum.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
