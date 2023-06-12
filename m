Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1319BB1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:13:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f61735676fso5618399e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593623; x=1689185623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/LBfeJMgyjV8NGX9/v4LhJmVdD42iTIOS8P8na1j4=;
        b=cVaUOU3twqJcnPq23//TWRNriotiHMkNEZgL3xVpaCbCQ7ZkeJ8GGnfKIfQT2ma+H/
         UL6DWF+oVeQjitBHMDnm05030o1kAVADa/1wcQIKDZmOA8nIaB0ayfqgvuJitrNhLZrn
         Yk3DRYB7+2vq890kqTkh5TqHcyxhmpRPXhpERRrfiJDNtLo0/KlYLaCq3kNxhPukXKfn
         sDtv+ZOISEJm/e6jqioaMAq6kotlRY5IF1ygkXlabfPyU/nZcE2Xaikb0J3cpvtsRT6e
         lHIEsC7WYBYNkOeuW08Ir1JnZy4iEQZbZ+sAd/z3SOBG3OV1yeVy3twIHGeVu9kWaOGw
         O1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593623; x=1689185623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/LBfeJMgyjV8NGX9/v4LhJmVdD42iTIOS8P8na1j4=;
        b=l/Oww6ao21o6adKaQwWipoe3cgytxR1VXjEeZC6eCjkh2rDEAXHeBm0HCPx0R68G8F
         QoZTsaoLlYa5NEbYv80W3J39UnUcp58iiX4QoTl1sbYHsxtpF2TnWRPG/xxRFp7XVftB
         9VK+2ysi6LjKxTsHdPdRCWhG7ZoptAaE71AzUOU/oIGPSQ7CCYI4TtKneupLr238NuOD
         Tz/MWM/4DfPEY+9KU+kscPT0KkfadCdHmW9AcbIkw6JXsfTb+DIUG0NlxCxqHpLr7jX8
         nBpKaOcenRxdtGFLv0zDaS2nt+6fJssM0BNonCoKrjMsI0rlZgDMbWjpEyBHGTE7C622
         BW7A==
X-Gm-Message-State: AC+VfDwVl953GfFnziDQCiFbWALgGM3rLqs9/U8iniZuEhuAOyuZIyTG
	kM9ehY5JU/AEsQjZKJ4jDw4=
X-Google-Smtp-Source: ACHHUZ7HduvmTKpekEbOqgYGaVZMyrmqjmJZvB5z30bcdtnnBg8FQEFoT2FhVdeLYkWAwBNibseBnw==
X-Received: by 2002:a19:f204:0:b0:4f6:266c:22fa with SMTP id q4-20020a19f204000000b004f6266c22famr3828257lfh.49.1686593623186;
        Mon, 12 Jun 2023 11:13:43 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d16-20020a056402001000b0051849ba515esm881682edu.13.2023.06.12.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:13:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Marek Vasut <marex@denx.de>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Sam Edwards <cfsworks@gmail.com>,
 =?utf-8?B?6Lev6L6J?= <luhux76@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 4/7] phy: sun4i-usb: Replace types with explicit quirk flags
Date: Mon, 12 Jun 2023 20:13:36 +0200
Message-ID: <2683193.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230611233241.14235-5-andre.przywara@arm.com>
References:
 <20230611233241.14235-1-andre.przywara@arm.com>
 <20230611233241.14235-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 12. junij 2023 ob 01:32:38 CEST je Andre Przywara napisal(a):
> So far we were assigning some crude "type" (SoC name, really) to each
> Allwinner USB PHY model, then guarding certain quirks based on this.
> This does not only look weird, but gets more or more cumbersome to
> maintain.
> 
> Remove the bogus type names altogether, instead introduce flags for each
> quirk, and explicitly check for them.
> This improves readability, and simplifies future extensions.
> 
> Port of Linux patch 8dd256bae653.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


