Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443F7C
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Mar 2022 10:33:12 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2db569555d6so11671817b3.12
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Mar 2022 02:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3UgdP2Dpp/ayPL7kDyX+opL+M19kkYSAxJLDHKMfOjo=;
        b=hgMHnafWoG7jhNO+4dBb8l3Xj0JRlTx7aC4SxY7F+BOKwgMy8u54J0jEjDFQ/zS9tr
         781mmzucZbg+phfSkFd9ySl7bdiWpmEK90ZMbm/HqtqGWlqPpaTtUDEfEcEPlBuR8wsK
         ZvdAp3O/Q0OeHND90mkw42O6HKMQblR7OzOhdcPGYQcFr1fdAl7vIG6NqgsNr+uJYoAA
         rHTsc52QEwB5qJD+5bu1FB0u7n5BSKP6H3gCNGE/L2eJjpqbxvk0HO0Cf3+ioNDf1XzG
         bATChf3BdOc3wtqWiZW9DuWAq/zDC9oJ/zj89BAYnou8MvFFARE+Vk5LghE3cvxrs0Qu
         TkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3UgdP2Dpp/ayPL7kDyX+opL+M19kkYSAxJLDHKMfOjo=;
        b=0UfGeZj5eD2oyTHKe8QMKlR5ZLeS/M59ESM7gDpV1nbeNH5RLlv8f2PloKZL9UZFuR
         fDSjyr9DWX9EJeOTLDk07AXWyLPMYiefkfQLNo9QdP3W54KcMaIEtSyhis3pMhNX6htI
         mZ9r2yrhF76c6NcSTmXJSvXEmMdsEUBQVlLKm/MW0l5NcPqxf1LCX1upRNZvYCFvv35f
         nTUbIaHgTIgScr2n5iUrikSTLtr4cggulP2ApGexqe2BZNm/AYdrzdYXqbnw5/xIpM17
         RbrA0kAbQhVO1JOp/tUoBmS4fy8IhWHPj+cNpbtmy04hzHuP2ypWMBJxFur/c3UQ9MXL
         12TQ==
X-Gm-Message-State: AOAM531CGqN4RZPups1XQMHxYq08UiPYCVXr9aq5faS9hwZXaUb++/Dr
	Esq/c3gCZSvGqOVxBV7pSuObHODpa3RHkqFwqo8=
X-Google-Smtp-Source: ABdhPJw/fyplq0eveO/WZAJ9BKAE58Gzeab43u2IhFVd4Pz56JPXFmPNyZ6iFdCRjIel9aE29x2PRK0WUTlcWe1tgBY=
X-Received: by 2002:a81:4503:0:b0:2db:83ea:6914 with SMTP id
 s3-20020a814503000000b002db83ea6914mr13732773ywa.42.1646217191339; Wed, 02
 Mar 2022 02:33:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com> <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
In-Reply-To: <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 2 Mar 2022 11:33:00 +0100
Message-ID: <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
To: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 26, 2022 at 2:53 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Just to rule out that the PHY may be involved:
> - Does the issue occur with internal and/or external PHY?

My target boards have the internal phy only. It is not possible for me
at the moment to test it with an external phy.

> - Issue still occurs in PHY polling mode? (disable PHY interrupt in dts)

Thanks for suggesting this. I did tests with this and it seems to be a
workaround.
With phy interrupt on recent kernels (around v5.17-rc3) I'm able to
reproduce the issue relatively easily over a batch of a hundred jobs.
With my tests with the phy in polling mode, I have not been able to
reproduce so far, even with several hundred jobs.

For completeness I also tested 46f69ded988d (from my initial analysis)
and setting the phy to polling mode there does not make a difference,
issue still reproduces. So it may have been a different bug. Though I
guess at this point we can disregard that and focus on the current
kernel.

I tried adding a few debugs and delays to the interrupt code path in
drivers/net/phy/meson-gxl.c but nothing gave me useful info so far.

Do you have more advice on how to proceed from here?

Thanks

Erico
