Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2829623A6
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 06:01:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id a5so20365611edb.11
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 22:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myor8n787DIBkDuVhefOsckVQpCRvL9+vEoJMW5tQZ0=;
        b=pPsj20BpS4ORtdE6mibv0QMuBA6Ig37PW4ZlcrAv+d715th7RdYh0EB2hkzYzQ116G
         l8a+1qOaYcWxpbDwBeO8aK4RJ7AWy0oJnUkQd2bgia2sBEy21hUDzkXmnjMiD7zcKhE+
         JU5HghiJELpmf4tF8PkOxK0+Yjo+EQWO59ou+P+UI8dmmJbbGbQ2V8OcAQ+/SNWUj/W8
         AEmsjk4NFxfkYxhGZraXXO7pxBTB+yUibGUwfN1co3AUZFvLQqrj6WNar9AE2SS/KuaN
         eE0qPp6XzMIZkYyo/QXK50m8fu/fA6Bxqze9Kxcqa01E7UavD9zQPNYjuGdfiMV4RrWp
         5mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Myor8n787DIBkDuVhefOsckVQpCRvL9+vEoJMW5tQZ0=;
        b=froIwEVgdugYrnlABLnCISXSl0SmuEzZ+X+ZLdx5iOfgiqgfc0mSLd4ol3dF9k9Tky
         dwpfZ2dnzKqzipgcuPMeVsliK2z6RjTRs02B/4YQOX5IMyPzAdSnRyhhreJjn1j1DcMY
         LHFXVXFNIt3xNHuOfVOpHaCQ6klPrjtrZCP3isPGR38AJv9zLDYnt2+ER/fqh276anqi
         H8G1hIKmoA/l3G4fSrGI3YiCGmb3PCE1atp4brSzgjCV/CKZT5Nbi1PCCh3TWKbxKzEo
         YSczC+C7XO2tEu4bYskRSWaftcvo/LWWANjNjL9b0yH5be0sFJr0XfZolQ4hh6A2FKpJ
         T9EA==
X-Gm-Message-State: ANoB5pkoA4aTze89Tg3OKQVPCugRz4YP44HtR8HAwYNxpe3ef7kptydi
	iNkvsxCXHPKXo1iKo9k+ti0=
X-Google-Smtp-Source: AA0mqf6i/3jHh060R/CT+OjGDanwY7AeoEfxktpAznZjdGnSsvDp8mT/+1qho0mFOEhF9tNVyrlqiA==
X-Received: by 2002:a05:6402:17c2:b0:459:443a:faf4 with SMTP id s2-20020a05640217c200b00459443afaf4mr13748008edy.297.1668492097365;
        Mon, 14 Nov 2022 22:01:37 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 3-20020a170906328300b007aec1b39478sm4953604ejw.188.2022.11.14.22.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:01:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date: Tue, 15 Nov 2022 07:01:34 +0100
Message-ID: <4438485.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <Y2ypy0CM8rJGu2g4@matsya>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-4-andre.przywara@arm.com> <Y2ypy0CM8rJGu2g4@matsya>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a=
):
> On 06-11-22, 15:48, Andre Przywara wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> >=20
> > Add support for its USB PHY.
>=20
> This does not apply for me, please rebase and resend
>=20
> Also, consider splitting phy patches from this. I dont think there is
> any dependency

DT patches in this series depend on functionality added here.

Best regards,
Jernej



