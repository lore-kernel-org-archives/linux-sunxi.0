Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356541865E3
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733368990; cv=none; b=Klktt74TL7YJk6QaNciksVgSeMaySrHZlGtqOajouRkMc/Phic3acxJqvKudSNPHX3LGldaTh75M86K6BJBYvp5G3uZeTXamjj+Yw/ZBoflHgq9cX9PAmxIkjp7+82kQ947ncol+mtfOYVkJcQuv0XswVGbynHc8g5a+4/y5wE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733368990; c=relaxed/simple;
	bh=+EO6J8kgF5TZ6sv4dT6wkIQhsuMHYqCRsITgSQoB1/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD6+HLIVgImQMkGOVklITXvwTMlXaQiRu0q1lNfzmRh0d3XaE3e5h18vx6Ady+f/2vlcgGGT0dgAR4mH4Ot3mVvc1kE24+bwigf2ptceAGxRKwBdMJxRVwDsN94pPAU+UjU1LsIRlWUzpGiadIZmB7gdRCSCAC5STL20kqB9ZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so3017571fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 19:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733368983; x=1733973783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5SX3vvLoPm9Eik2OYGQGpzcsjOKwp5Zg+ZD1GAa2Zw=;
        b=nsOERjlLfbL+/pcDdO2Hd5yMiBjrudNwpj/MCuYgdvPmsiS5R4gSx5QLMcCG+5FKT0
         H3ONSE+KnpEeGnO5cMN/T8cvG0k4VBm60i9ykz8STMa4o0Ag260d3eBY8Va4lkvu2OlE
         BCNH0F5rYPrwaspudX+bz/a9/nxvG1xWsP9is+XQRyiFmoeD+k1AaQXSiiqZ46bpYdO+
         DMrEqLBmusIl5799KCK6sHQQmcpdC6XpE2PlvnP1gRQNYjc46xWavaNeiJpVbCCZfTDx
         A3gcvDdKE/BkTWk1YDs4eTABYEYTWpTY43cW3V4lCmgDCs457fb8P0jIFHv2LAUvWz1r
         vBcg==
X-Forwarded-Encrypted: i=1; AJvYcCXagNtiQ/3ST7GlXn86Q1HDDabaqjBpVCXUpJdtvJGeSXKEEI51lFSctTQFjoJCC+Cq0212MPDMwQt0MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLXqanVAtJJhRip7yopWgnayYVAvn04UYpdbVXRUOdeo//Hrs0
	BKGSKBiEEvb9227/g2mOOjaNkcf11+2fr1rSRGdIQOPMW+eyIOcrn48Hj4YK
X-Gm-Gg: ASbGncsG302TOx/fAOTew4efp1nSzxqqTIH0uFM2lv9Cheu0dzEuU7p735RDPW7qJEC
	DVBIVVlJxivz0XrcK4rBm5Mzc5Z7aLYOx2XhQE7xdkziziXMnOWmYxF0ZM0bxed1nhL28MSGByu
	RSIDSCXdEQazBC7uZY51899hogVsuYidBqpIgps8sUwlog6pLXfQTBdPzQYx5s+AkcjRlKBCklL
	VY8fQOV1UgPT0Hj7BDXfabVrsokLX8GVKHZXAr1i4mrYM3k/dM/eAA3hFuj44jQQH9QHmp9ycEm
	uxX5ljg=
X-Google-Smtp-Source: AGHT+IFs9ISHIe0gXSotdmyasYrD4DisLR0FXIkXNwDEZj+9VtTcRZQwyhCpqQy5K/voPqro+noekg==
X-Received: by 2002:a2e:a9a6:0:b0:300:1aa5:4939 with SMTP id 38308e7fff4ca-3001aa55751mr19816491fa.15.1733368983294;
        Wed, 04 Dec 2024 19:23:03 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e7463dsm759821fa.123.2024.12.04.19.23.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 19:23:02 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so3475331fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 19:23:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyo+3ghZmrcpcAEaBaUK5iC+RNcBIahmFOGYzSnQq6GYcR+GJhnGme778z8A5TR4e9ksUulTPwhP9yRg==@lists.linux.dev
X-Received: by 2002:a2e:3507:0:b0:300:17a3:7ad9 with SMTP id
 38308e7fff4ca-30017a37d6emr21436331fa.12.1733368980758; Wed, 04 Dec 2024
 19:23:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
 <173331833897.673424.223627111827356616.b4-ty@kernel.org> <932d4f7a-c9cf-4e48-afd3-476b6c0fbc86@prolan.hu>
In-Reply-To: <932d4f7a-c9cf-4e48-afd3-476b6c0fbc86@prolan.hu>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 11:22:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65M9g-3nLAe=7Q3sbJ2wtpvQXXVhb+h08m=2pWY6g7HzA@mail.gmail.com>
Message-ID: <CAGb2v65M9g-3nLAe=7Q3sbJ2wtpvQXXVhb+h08m=2pWY6g7HzA@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] Add support for DMA of F1C100s
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Singh Tomar <amitsinght@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 7:55=E2=80=AFAM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:
>
> Hi,
>
> On 2024. 12. 04. 14:18, Vinod Koul wrote:
> >
> > On Fri, 22 Nov 2024 17:11:23 +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> >> Support for Allwinner F1C100s/200s series audio was
> >> submitted in 2018 as an RFC series, but was not merged,
> >> despite having only minor errors. However, this is
> >> essential for having audio on these SoCs.
> >> This series was forward-ported/rebased to the best of
> >> my abilities, on top of Linus' tree as of now:
> >> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitla=
b.freedesktop.org/drm/kernel")
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/5] dma-engine: sun4i: Add a quirk to support different chips
> >        commit: eeca1b60138189ef1b9636709e578d0c9e0de517
> > [2/5] dma-engine: sun4i: Add has_reset option to quirk
> >        commit: 1f738d0c2f67ae3551e4543e8dddbfb44cdd9f53
> > [3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
> >        commit: 1ad2ebf3be836e62792788f4cd105b30ca9178b6
> > [4/5] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
> >        commit: 61785259d1eb4e4c4acef8551a2524441683dbf3
>
> Thanks! Though unfortunately, b4 has once again mangled my sign-off,
> leaving it empty :/

There's one or more issues filed for b4 regarding this. See
- https://github.com/mricon/b4/issues/50
- https://github.com/mricon/b4/issues/52  (filed by me)

ChenYu
