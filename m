Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C166408C9
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:42:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f7fc9014fdso17034595e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686343336; x=1688935336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMxKie80rvEGWv9A4on99hGPyadzfgexUoICy0aDDiw=;
        b=ksugcOmh6dEfIb7R7/fAxYzvYiHfqp6Cvl9UlAPUgiJQeOuLmzWgrivsXwz7QE0iVS
         NJ99hRb6+cOaeRAFUwFfhn1cM48osYPvrj61K8H7MeRJTsHdmO1vY8FPGLOqr0MXkuoV
         2CezFxOWx7Yl75bHz+hG02ehctcf57k9W0TPlzve/JiNXWPXeqaArsQNcIUfNM5o6KwV
         QKVXVmZ3otjSg/SbAlvBrhRQKjK+z4OcT/du9mLdsYk5WAW2TGrSWVa114FWpA38wJnK
         0B416sSNjIvS9qYnmpfW6+nfNHs2md55aIPd8eh6RIi2PsQwXAodQw4ZPMOKIz2pZRyC
         3xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343336; x=1688935336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMxKie80rvEGWv9A4on99hGPyadzfgexUoICy0aDDiw=;
        b=FIX+UE2eAvksvxAcrJc7EuMjYp9xPNAsDZvAR/TeCCDYA4aDeawWpSPYFTNlWNZeYr
         UeXVJiatL2RH+Z1QmptQlaMjOoJb6XwOqVvBzPXUrED2AzSzbTdXyWlbNFafESXe/U/n
         QcGEpev/+Rp6er86NtUIzRHwRq3Qy8osLVqzEIHXD3jCtmUxsPQahIUZghkke6v5leyy
         ca6zCj1zEcFLuwjDArSI1P6dVhjQTReMi2r+YqoE+cnfF5aS+4wmsBfIfITdZwlCTJWw
         +HFTwfVLZuQtXrI1sg9gWuchcI/8PI5p/dASiK+mVsixzvl8JB5LJnWc6xj4g1c9lWZX
         BZwg==
X-Gm-Message-State: AC+VfDxCROkko+ljdmYtG1zSSNO1cxrJrCG0ElU0ucpSwTHB+OGfn2ZA
	Rn8SnlxI2EG3NcYszXuS5Ik=
X-Google-Smtp-Source: ACHHUZ4aYR7WzTbCfmikeeLGvvOuaTdfzAlk4KFUxhpglSzws5J3KUFxsGdk76E0qAsMQ1e8aFs4xA==
X-Received: by 2002:a7b:cbcc:0:b0:3f6:13bb:f00b with SMTP id n12-20020a7bcbcc000000b003f613bbf00bmr1723457wmi.8.1686343335778;
        Fri, 09 Jun 2023 13:42:15 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d4e0d000000b002fb60c7995esm5348525wrt.8.2023.06.09.13.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:42:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Sam Edwards <cfsworks@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] sunxi: Kconfig: rework PHY_USB_SUN4I selection
Date: Fri, 09 Jun 2023 22:42:14 +0200
Message-ID: <3504459.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20230609105621.1410483-4-andre.przywara@arm.com>
References:
 <20230609105621.1410483-1-andre.przywara@arm.com>
 <20230609105621.1410483-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. junij 2023 ob 12:56:21 CEST je Andre Przywara napisal(a):
> At the moment we use "select" in each Allwinner SoC's Kconfig section to
> include the USB PHY driver in the build. This means it cannot be disabled
> via Kconfig, although USB is not really a strictly required core
> functionality, and a particular board might not even include USB ports.
> 
> Rework the Kconfig part by removing the "select" lines for each SoC's
> section, and instead letting it default to "y" in the PHY driver section
> itself. We use "depends on !" to exclude the few SoCs we don't support
> (yet). The Allwinner V3s does not enable USB (PHY) support at the moment,
> even though it should work: let the PHY default to "n" to keep the
> current behaviour.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I stumbled on this issue before, but it didn't bother me enough to actually
do something about that. Thanks!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


