Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9B10F4
	for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 07:37:41 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-561b7729a12so47150707b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 May 2023 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741060; x=1687333060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOQE4VDyp9QIs6NnGgNh52U8dycaA6C3cQQrIeSpbrg=;
        b=PmRtzZjd/eb9Y0P++rxNgxg/Oc5DASz5+rQJjU5EAJMmbpOLYi90eqSsYjl1Fh1tp4
         hmqMtIHuqXlH9dcoz89vrxb7CU6FjHHjf81IORoo8hLRDhqxbWvilYFdWlu+8n+2S76y
         WhOA+K70xWiW65fFZdfz/ByBGrGCez3rkyxJOBylHoezUrOw24z2gk5+8i+KaVqibDxS
         O8YH2hY0OEBKm79jKnw718EutuBzTa62OXFZZIYCTgkLTusiSsOwwKtb95P2KkngrlSt
         Hybi9xBTPRdsctyktMzhRegEWN4pMqqSLzorNznU88QNAVgom9URAc617gjleWu2bn2Z
         s7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741060; x=1687333060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOQE4VDyp9QIs6NnGgNh52U8dycaA6C3cQQrIeSpbrg=;
        b=Hxs9DuYShuLqDZhA3EyEIln0pO59SpDa1N5ZSfsgguJq1Wdl923AU0qL3ulxN/9Z09
         VfgSU9sTVMTW1KrKQ/fkfNl8QT+WFIqhexKaOrQdlrO9AorcDPFkZKFZFLi2TXCi2mJ5
         Fc7u22XPPvFkPetdgMdTp5NIRbyrBo9pHoatmg0+omOyrj6wQCvBM5x7JXoqjOqVj+jX
         +AcKGX2C7tQdhZBGuzaEITfZ2Zex48Met2+N0m3pbLXq0h84P6BklzJPCrYI99jNdt5S
         Ox65+PZQM05/nwVjgZh+FX2Y2N4VOX5TQ0rgLr1Xl5ISEfYEL/YpUtv8UOp1GMWjcrHh
         9dAw==
X-Gm-Message-State: AC+VfDydAYyMLyhwfSFoZ/gaA8QRWcOAocE3kaf1/2niZ7xwcT6bI9zb
	JhCYUK/ChKy+K5gtJXRSJ4leYKPU5WOVREqqBiiipA==
X-Google-Smtp-Source: ACHHUZ4OlwL4eFt5zi+AsH8sIY8nmp4Gyo36E4mPxBwVrmJ1xabFq8GLNTy4Q8brmKGEiTqA8kpTFdMqSZoEtMrb9T8=
X-Received: by 2002:a81:7406:0:b0:561:be2a:43fa with SMTP id
 p6-20020a817406000000b00561be2a43famr10697543ywc.7.1684741060509; Mon, 22 May
 2023 00:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683719613.git.noodles@earth.li> <cover.1684258957.git.noodles@earth.li>
 <7691a35155cf644c2efb02c282c5ef007a6570fa.1684258957.git.noodles@earth.li>
In-Reply-To: <7691a35155cf644c2efb02c282c5ef007a6570fa.1684258957.git.noodles@earth.li>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:37:29 +0200
Message-ID: <CACRpkdbgL68SRwMs5-TDre8OBZpAtXeMGrBsQrEs8B-RO+X8Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Add GPIO3 for AXP209 GPIO
 binding schema
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 7:47=E2=80=AFPM Jonathan McDowell <noodles@earth.li=
> wrote:

> The AXP209 has a 4th GPIO, so add it in preparation for support in the
> driver.
>
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
