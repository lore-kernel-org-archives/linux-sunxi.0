Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973221CE4
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:15:49 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-977e0fbd742so679932966b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593748; x=1689185748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIIz+zR9TB6aKqRInYxITfV47q1fjJRdvjVAc/0LYak=;
        b=qSVzckpLC2O15SEH6nnf3WWvlUSV/4jm1HjepXLiHUtfOWlL8LKX0M4TQhb5loeFUZ
         eaiUvO97Sej6y2Ey49OgVGF3TQDhrW8Mp2O062wSGFieVK2bsA0z8JD9UfteMUjqM9w9
         t7UxfxN47sWSzE3jm4yFKD06KL36gl9phlU1MR6WHa7CiopeTVDjJXZa7B691XOxpBpg
         OXNJ8c8q7556RpR7Ic6ZDAUSCoqynS8yV48pVedkYQr52ytVPWvYq5U9pF6p1oHhVj9m
         sOGbzJSzJJGmJC6nD5S3zP9MjCLavLrx4hTgLQanOuvBBbfuJx6NUiFKb/rgqIVf8sd6
         7/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593748; x=1689185748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIIz+zR9TB6aKqRInYxITfV47q1fjJRdvjVAc/0LYak=;
        b=SaV2bIeswqQtkaSgGsd74aExkU0VnnR2eTuwxFf1AuRo3T/GtAYweCpZwkQKh5l9uS
         BIG+K6L+QKl8fBpV8mXIH0VxRWKOrC8Af3KdSJ+g9HLQ0CRCJSFruQS6g2Rs32vn00BW
         +MdyQs13b0ENmMP6o0LaA6YZEvOfrotT4OKT12kyFoa9FdG74OI2/GSTY8aP7te/hjg7
         cNYLQL0ai2+WMij1fqktTf7ypFGW1FS+tGfaAwXncYBhA5cJj9AbOn4iWyhiuju7Y5vl
         s6Q/NLQPXTR30WI2FW4mCAXkei01Pdzv8ILc+XXwU876FrqTWYbI+xEpepm7uhv27RuM
         yJNA==
X-Gm-Message-State: AC+VfDwcYGRaCQ4YSlWAHoyU0hbEl8lj5rf295hUQufSKQMpJY0HSrhf
	yLxCMjCVnOPsGlBqDwqr8/8=
X-Google-Smtp-Source: ACHHUZ4x/mcqT4BI2lje4nDvZYgROODTsFgYtr5sqYzfBrRm1vgtBu5LWKxY47Js9+9Tt+OjkqAzNw==
X-Received: by 2002:a17:907:9611:b0:971:2eaf:556 with SMTP id gb17-20020a170907961100b009712eaf0556mr10339470ejc.18.1686593748089;
        Mon, 12 Jun 2023 11:15:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b009788d51e4b9sm5543945ejc.130.2023.06.12.11.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:15:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Sam Edwards <cfsworks@gmail.com>,
 =?utf-8?B?6Lev6L6J?= <luhux76@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] sunxi: H616: enable USB support for H616 boards
Date: Mon, 12 Jun 2023 20:15:46 +0200
Message-ID: <2284069.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230611233241.14235-8-andre.przywara@arm.com>
References:
 <20230611233241.14235-1-andre.przywara@arm.com>
 <20230611233241.14235-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 12. junij 2023 ob 01:32:41 CEST je Andre Przywara napisal(a):
> Now that the PHY driver supports the H616 USB PHY, we can enable USB
> support for the two H616 boards.
> As the OrangePi Zero2 has a USB-C port hard-wired to peripheral mode,
> let's enable USB gadget mode for port 0, so people can use fastboot,
> ethernet or mass storage functionality.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


