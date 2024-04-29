Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842C40843
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390783; cv=none; b=aIzbvGx/MCylj/W+4bgcvTuHPYC7yxrPmSgotjWiqTAm2QVaB8Wbxobmcjx6DORVK8RvAVXv199betGZe3TFX4yZao8XFgVcwI36mPXwuh/Ebksr/EIWmLeAphCThw1WV1QzV0VHl0xnKlSaajPjP+jLUX0uNkSJEvYy+Qa54CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390783; c=relaxed/simple;
	bh=I96nVD/pvl/HbzA+JSRfMVYooN/S/Dzke1463qRCo+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DR9o7F8k8attMW/Ed8EYyZp5XA0xRkRdIePXql0dhX/7XPtJIEH1d4/gAzIGNf9ND8drtu3BfPKQiuVK+Y9JEeGKPpmk6Ho3zI36dj8s7jdo7MwmNwm7UEYoxHhB3ocy/juiGidLAH6UAuNedzCAIeT2YRnaemd9/vTJxwwednE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QPbOADfK; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QPbOADfK"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-434d0a63151so26136261cf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714390781; x=1714995581; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=QPbOADfKV1ZgL5eoW7qM8vByyy1iq93s8fzlasmm3u6Lq4mHUkNhIYsCujey/YuWzj
         oSBDfxV2cZGRuy29FjsG+LpedlwMktx+V5zJ3okAU3k0/K8Mp54jzm5DE6vgeJad5/Ks
         45DXSf3ViA1+3tOx2/lPDQ1TYY563fl/soLVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390781; x=1714995581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=bEVlKehbjLIkG7cTLSZI3h/q+rA2T/LrEaIvJbCbbAhuTu6IObzSDu68bYoZ7xP/zY
         wzVohGaQBeV864heKBuGMgN0qOxPBy2L5exmLfUgWPj8msF0eZvRw/JKoJBjyihn7bng
         uqueUNk28nsUQppN+HGsWJRB+Av6rpLp3ohiByvtLIVGiInN9mXzyTqt0/DFqYzw9nxK
         SBKmTHt5XRaNkDXnn9KOsDhQ5pOmck0XzGnkP5jJvgfsdIq05fzbnvNEDoxQKHgz7Gk1
         9HHejRXTEI/NkqbZakTzo0UmLN4U84I7meajE7eikTw54pC61psHQHXTkytl+ld9y7ta
         Rfqg==
X-Forwarded-Encrypted: i=1; AJvYcCXvAY9oRtjNJk0AVZlCOTJOzMKql0vdm735l/Cbq+hjVbYiu0DojA70V2ERaEDXUme685brYTIqonKbUwpWRrOuEWmbRLCz1GJAWhI=
X-Gm-Message-State: AOJu0YyG05C9TPoaIFHkuIPfUDe7qAcLaVqmw/S8yNr+MujRzFuqa0BG
	zZIAtvFuCet2QCQD0MnlulsWSda3lXyaDvdqTMym0kyBVQR87D9jMfV3I3J78g4xACon0oo6NdQ
	=
X-Google-Smtp-Source: AGHT+IGPpxze1wXEEtmOmNWDzsA8AHauL/7a2GkvUstXVJf9/ibuCX4M39wO2l/6kXzJscFfpUS7dA==
X-Received: by 2002:ac8:7c50:0:b0:43a:62d3:2cf5 with SMTP id o16-20020ac87c50000000b0043a62d32cf5mr8789462qtv.2.1714390780791;
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id kk3-20020a05622a2c0300b00436b2135b51sm10298360qtb.64.2024.04.29.04.39.40
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-790ff1fa7b3so29443585a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmf1mUQvcFJyJQ54xMp6VQzcmuEEk4mpoam3eVf3uuGT9FHYAmfg7ZXSkGeverPoEuoNkXP4U9lLyJs9M4OaXhquxYr1VGePQuxQs=
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain> <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!
