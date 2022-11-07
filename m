Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CE7F
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 17:18:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d26so31927557eje.10
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+FL3EYtmTevx+/qcGveIJl0H5e1m/91jGuQ0ro55J0=;
        b=DUznBw1PxsVpisi4ux5m0ygNTpMneN6HgLhaY0gCqNr4zYyifoCpVqSKvsnwyJjnC2
         i5Rhq2cJARubP2+64WPHBO9zDgjXOhXQkStEgAvSQ5hOYRhHA0wzA0jCNfBsFAdDoCb+
         91Fg4uAoTzylUw59WfohWOi4vdAf67w5uROfVrPa6dseoQNYSZ1w071aLrDPRIMTtgtr
         imE2N1dWD3HY9T227a0AIALk9499TodWKdOcKGqj/vOr0q3J+YFgzGPvR1ni6i8drW+c
         17Sdtb6a5LyC++DUSUoGzYZLBujb5VtR65SCcDki4NZLNQme/ZnT1GrUKIA0+DOQeuoe
         LVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+FL3EYtmTevx+/qcGveIJl0H5e1m/91jGuQ0ro55J0=;
        b=XWaJGlLQmvTeLAuu0vrIRsA6ApiDtMyOiqobLhf33cS08lfHV6kERjlDnan/IbSke3
         FkNqwPMhPBkE8dFBALJNAS/GZkyxn3iYILzhnNjtPXRpJWWwfMiInRWWtnkz24favJy1
         PaI+JbQchUli0RSCh/7cq96c2Pa+ECJyIIQ2AmvhELwMUAU0/NpncFs9CoX1AF1NvcNz
         nWMUuN4Gr6duTI4w7bdon+qZyMg4+qCFGTqoBOw7Q2ACNkWngra683sP/0aRX+cpElYD
         1SfAqJbOZ6aiGeL1v6RdZTMijNkBdcfnkmWHZ8x0qHfIinrMP42LRannW4tC57i61T6r
         0z6A==
X-Gm-Message-State: ACrzQf3o7ASPEU6J+ToIdij5va6V+aJ1yy4CC0gyPKSODCEMWq6ZpD8l
	2Rm9QUpX5mx9/fErY1abxKs=
X-Google-Smtp-Source: AMsMyM6mV3aLso4CUT6uTdUiMHuu3LgcREAPDJpTwtCVBhcwZHXn3+qSLcJ2foQdm1a08lQY1XzMNQ==
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id dr13-20020a170907720d00b007a9b7e68612mr48312406ejc.435.1667841508935;
        Mon, 07 Nov 2022 09:18:28 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709062b5200b00731582babcasm3698252ejg.71.2022.11.07.09.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:18:27 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date: Mon, 07 Nov 2022 18:18:26 +0100
Message-ID: <2652859.mvXUDI8C0e@kista>
In-Reply-To: <20221106154826.6687-4-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:18 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> 
> Add support for its USB PHY.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


