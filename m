Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D71FA0
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 15:24:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v12so19928316wrv.10
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rKwtLw3cM+95hvuJT1geCS3rHMfOzSi9KoR5XyQyqpA=;
        b=wvnRNI989Cr31sBb60Fzfp/CEVVtKm1DOJMlpdFbxF/KhSuxQmEPKGOgfCZv5fw6ii
         EArLsqX/FVAvXoqhQBSxfIvtiinaO2PlnwacCucDvSfvypoKh9gu6dxN1NK7Zz5SAeX2
         s+yhqYOKRoSnGJHQw61bcsdDsXGKAhnNDPPCoJzlLpwkKWk2kUplS64o/XGdwvupCzAq
         bN3RSr93opiPNtq5aWUqXeQ7BRH+dNtCNC4DWbSZHiXJQ7zkBy9PR1wNmt2nm34V7q3m
         nXHhXaPENXXjfrjmQrhqcv3LcIrXrWaBEPAuZEHX8npUfkjbDNl5mrMFKzfA5SHniLre
         BUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rKwtLw3cM+95hvuJT1geCS3rHMfOzSi9KoR5XyQyqpA=;
        b=xH/PS+/XFeoX4HDyH5D+/2IHrnrVVEKnWF8vt/Agylmapg36i9NU/QFBmK6MUrJS46
         rnKM/8a7qzNY5tBrUP1iylbsTc1xtWxIbAYqjO1ab+lau+9HjLDFI4kvlXSfrNCnEto8
         RDHbutsWO+WXuCvKPrR3Cnh4kjO2+SlP1AHX5od2UNWW+CX8mhSdg1E1Dn+jg/Lnw5uF
         ZD2nbsxdUhAaAmR/VMMKMqccU5Ul+NU8sMTT8N2h4oVPofEJHCjFUQ5R6Wn/vRy1iLBk
         qVLuar7caYwweTE+CyT3z4/Wje5KreSSHJZnKOxaRG19qnc9tkQND1nDn0yxU5t5lLPs
         DtZA==
X-Gm-Message-State: AOAM532EpRn3preLiL7JsxJ1rOy+t2H8G75QcVlCf/Mek8Hf6Ui2hyJ8
	fTNlF6wMyQiX8aEZ+3ZbfXTIdA==
X-Google-Smtp-Source: ABdhPJzDsDDrTemBeI3M748nGEAOCxz5E616Xce7ZvQNu0rMeHzDwcyWVElFh6Ahp8pSR4VPlT/esQ==
X-Received: by 2002:adf:d1c7:0:b0:20c:4d5f:e57f with SMTP id b7-20020adfd1c7000000b0020c4d5fe57fmr14372719wrd.453.1652109868819;
        Mon, 09 May 2022 08:24:28 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id o9-20020a5d62c9000000b0020c5253d903sm11539796wrv.79.2022.05.09.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 08:24:28 -0700 (PDT)
Date: Mon, 9 May 2022 17:24:26 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: alexandre.torgue@foss.st.com, broonie@kernel.org,
	calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk,
	pabeni@redhat.com, peppe.cavallaro@st.com, robh+dt@kernel.org,
	samuel@sholland.org, wens@csie.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/6] arm64: add ethernet to orange pi 3
Message-ID: <YnkyKiRmOEYEtO3z@Red>
References: <20220509074857.195302-1-clabbe@baylibre.com>
 <YnkG9yV+Fbf7WtCh@lunn.ch>
 <YnkWwrKk4zjPnZLg@Red>
 <Ynkw9EekNj5Ih5gc@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ynkw9EekNj5Ih5gc@lunn.ch>

Le Mon, May 09, 2022 at 05:19:16PM +0200, Andrew Lunn a écrit :
> On Mon, May 09, 2022 at 03:27:30PM +0200, LABBE Corentin wrote:
> > Le Mon, May 09, 2022 at 02:20:07PM +0200, Andrew Lunn a écrit :
> > > On Mon, May 09, 2022 at 07:48:51AM +0000, Corentin Labbe wrote:
> > > > Hello
> > > > 
> > > > 2 sunxi board still does not have ethernet working, orangepi 1+ and
> > > > orangepi 3.
> > > > This is due to the fact thoses boards have a PHY which need 2 regulators.
> > > 
> > > Why PHY make/module is it which is causing problems?
> > > 
> > 
> > The problem was stmmac support only one regulator for PHY.
> 
> I'm trying to understand the differences between the two different
> regulators. If you tell me what the PHY is, i might be able to find
> the data sheet, and then understand why two regulators are needed and
> if one needs to be controlled by the PHY driver, not the MDIO bus
> driver.

The schematic for the board is https://linux-sunxi.org/images/5/50/OrangePi_3_Schematics_v1.5.pdf
Which show a RTL8211E.
