Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEC19BB1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:14:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9745c5fed21so682345566b.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593666; x=1689185666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6JHdZn+O4dMKv8LF9TvlJrz0eZhBcVwfrfrw9rJjm4=;
        b=ZowmWJfmPaoTmsciYYI+YJhKb4zXkNBQFsSBWH9DvLLji5pT1UWVy83UcP9vlAk+k3
         VIrPZORPVS0ofoNMxrDxAtAJT0R9pLxrSaXLax7VcCx+CcBJVwXUF+qLpFLXAhPhyteo
         tTUnJIxt5sWFNctZCEqUrlMNK7O45ImvGn8mGMXDQt/gyWWuN/xex7TbfQNO+deR+Uq3
         b48vNg5wIfehjklwERIcgggQ3ycwBcdLsElZxU7qQqjRgMe+Na3rMlMrrdCLYkFz5NoO
         OoCg4/Ky1Zh3xZcrhv04qEk8/6h/hRO1X9dw7EOvs7fZDEzzNNkNgfFR1JeBVUyLejnV
         7AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593666; x=1689185666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6JHdZn+O4dMKv8LF9TvlJrz0eZhBcVwfrfrw9rJjm4=;
        b=Q6AE1aNRud59kkA+fZTTgi92eCzOsrqgmG1oqUs/AmJpGn5xFeiPcu4mHgB3Ep4YbC
         AwFTNCAnslxIcOlDBHcCWUNjeaD5RtU3H0ferjB6RmD7zwidNayWPnrDKbSG+JpPFz2a
         PenadN24BGEpT2ZdyBtpYjad3Xw/j3RSXgJDyX1MeyexBlD2lWf1EuT8Re28IlxZmomc
         1GFUDl4ZddBI43bRdhAy9IcG/xOfrEBrIZ5x04R+jOrzlqoOGyafrZe21Wia7ogfH/fR
         0+Pnp8X8WU39mIy6xzPT64kiThcwofg2iJG3+TLPY7dCyM9z5HPox6778DUA28IarvVZ
         OmkA==
X-Gm-Message-State: AC+VfDwbYvqOvqIu7lk9GLAkALRg9viHH92PupNITTHn3kdvhp9qcR+p
	HebANt9Zr7T9b/Jvu4h8uTw=
X-Google-Smtp-Source: ACHHUZ6ODS8vmXcPpLoZXv/He+xNMacvJwlvriNHgycSFTDZfvImooRxhA0tl4yo+LN+k3NJJRq2AQ==
X-Received: by 2002:a17:907:ea1:b0:973:d85b:9ed9 with SMTP id ho33-20020a1709070ea100b00973d85b9ed9mr11925772ejc.72.1686593665626;
        Mon, 12 Jun 2023 11:14:25 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ce14-20020a170906b24e00b00977cc3d37a2sm5480550ejb.133.2023.06.12.11.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:14:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Sam Edwards <cfsworks@gmail.com>,
 =?utf-8?B?6Lev6L6J?= <luhux76@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 5/7] phy: sun4i-usb: Add H616 USB PHY quirk support
Date: Mon, 12 Jun 2023 20:14:20 +0200
Message-ID: <5680571.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230611233241.14235-6-andre.przywara@arm.com>
References:
 <20230611233241.14235-1-andre.przywara@arm.com>
 <20230611233241.14235-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 12. junij 2023 ob 01:32:39 CEST je Andre Przywara napisal(a):
> The H616 USB PHY is some kind of special snowflake: Only port2 works out
> of the box, but all other ports need some help from this port2 to work
> correctly: The CLK_BUS_PHY2 and RST_USB_PHY2 clock and reset need to be
> enabled, and the SIDDQ bit in the PMU PHY control register needs to be
> cleared. For this register to be accessible, CLK_BUS_ECHI2 needs to be
> ungated. Don't ask ....
> 
> Follow the respective Linux patch (b45c6d80325b) and add a quirk bit,
> triggering the special sequence as outlined above, for PHYs other than
> PHY2: ungate this one special clock, and clear the SIDDQ bit. We also
> pick the clock and reset from PHY2 and enable them as well.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


