Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F17E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 01:38:12 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id hu12so5958824qvb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Mar 2022 17:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+eLQyXPwRhE9qtI+muNKcA/jvpyo9jbWJwsg9EgIx5g=;
        b=QhT8buVXHDVPijmrA8rTM4vzJEog6qpHK8zYn4hr3jLH+ZPn8XCwUUVE2AMLDlxD5A
         mYhsWmUOL3H40neWUzp4E7C43IdFYpHjJUWnNseYwC4PAxauw3XDjmVmHETeMnfWPx2g
         FEfclQfi8Fa/hGTrOF1U+Vvrn/VGnU7SUKBUD+giMEkAt9CHPJL3JmlysaOGRJO4PhQA
         wmF2LQVn4ekJ121jL3VyGnwXk+WeK7D9Pp81fnOyClkmv3pjRpj/bvRqjYXU9TUyogZg
         nXIOU+dGotVXj91pNLxuw5J/FQZM21Laaf8htmzrEtg7NwhBGEHH9vLq6UG1I3O4fTt2
         S8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+eLQyXPwRhE9qtI+muNKcA/jvpyo9jbWJwsg9EgIx5g=;
        b=mY5vQslbQ3wpVZrKzw9qNxs2sB93WmYcd2Y2te+nXdUGDA9EQ+RH8aKX2DjjozvNA+
         ZngWhw9iD6N3huvk6VuMNWwLeiQ54zC5CF+3yi8t/bzfxZThxy7ubmcUMTTI2ftRYY17
         18nkLqup3xBHN06jqzy/CmtjZOuqPqDEf6W3XhqcjCbIbBCKSH+ra7xNe2JN1DJtcfnv
         inrKE156cIojtPv29NJpvdUI0BJZBgdoZ3U+NqQIbFkKp6A3A4IA30fuuZSmRLvcQj1f
         D7jsLPDv3aV/dDiXdMGyeL0hgpi5Zhyg+7STJ3i0sF2mPCehUrZZs8VuaipoBfV5Te9E
         +2QA==
X-Gm-Message-State: AOAM533QjLCxorcFex+8H0+wEExonJUE1LhM/3QunuYAdiygvgabd5B+
	XQTWV+Gf/nlVIh/eiN3TMSw=
X-Google-Smtp-Source: ABdhPJwRyVv1gbpmZmPov7dSlCEQjzKhqVYaTuvU6hOXW9srQW5BYmxjlIZcVGqasMJMR/I0g/u7Og==
X-Received: by 2002:a05:6214:d44:b0:435:ba04:8f1a with SMTP id 4-20020a0562140d4400b00435ba048f1amr6226286qvr.78.1646962691440;
        Thu, 10 Mar 2022 17:38:11 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 188-20020a3709c5000000b0067b147584c2sm3098889qkj.102.2022.03.10.17.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 17:38:10 -0800 (PST)
Message-ID: <181090a1-feae-af6a-a52c-d72032a015a3@gmail.com>
Date: Thu, 10 Mar 2022 20:38:07 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/14] ARM: suniv: dts: update Allwinner F1C100
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 George Hilliard <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220307143421.1106209-1-andre.przywara@arm.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220307143421.1106209-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/7/22 09:34, Andre Przywara wrote:
> The Allwinner F1C100 SoC didn't see much love since its initial merge in
> 2018: the originally submitted .dts files were very basic, and didn't
> cover such simple peripherals as MMC and SPI.
> On top of that the watchdog compatible string was wrong, leading to a
> non-functional watchdog and reset functionality.
> 
> This series aims to fix that, after the series MMC and SPI work, and
> make dtbs_check comes back clean.
> This was tested with mounting a filesystem on /dev/mmcblk0 on a
> LicheePi Nano, also with accessing the SPI flash through /dev/mtdblock
> and mtd_debug. Reboot and watchdog now also work.
> 
> Mainline U-Boot recently gained F1C100 support, and those DT updates are
> needed there as well to get full MMC and SPI access.
> 
> The series is structured as follows:
> - Patches 01/14 and 02/14 fix the watchdog, which allows to properly
>    reboot the system.
> - Patches 03-06 fix some shortcomings of the existing DT files, to make
>    them DT binding compliant.
> - Patches 07-09 are Jesse's recent MMC patches, with the comments from
>    the last version addressed [1].
> - Patches 10-12 add SPI support, to enable access to the SPI flash on
>    the LicheePi Nano board.
> - The final two patches (13/14 and 14/14) add the F1C100 platform to
>    the multi_v5_defconfig, since it was not covered by any other
>    defconfig before, and an ARMv5 compliant kernel is not commonly
>    offered by distributions.
> 
> I saw George's series from two years ago to add USB support[2], that
> looks good on the first glance, I will comment on that once I did some
> testing on that.
> 
> Cheers,
> Andre
> 
> Changelog for the MMC patches [1]:
> - bindings doc: extend commit message
> - .dtsi: extend commit message, re-order mmc0_pins node, add
>    drive-strength
> - .dts: extend commit message, add alias, regulator and disable-wp
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20220130220325.1983918-1-Mr.Bossman075@gmail.com/
> [2] https://lore.kernel.org/linux-usb/20200331170219.267732-1-thirtythreeforty@gmail.com/
> 
> Andre Przywara (10):
>    dt-bindings: watchdog: sunxi: fix F1C100s compatible
>    ARM: dts: suniv: F1C100: fix watchdog compatible
>    dt-bindings: arm: sunxi: document LicheePi Nano name
>    ARM: dts: suniv: F1C100: fix CPU node
>    ARM: dts: suniv: F1C100: fix timer node
>    dt-bindings: spi: sunxi: document F1C100 controllers
>    ARM: dts: suniv: F1C100: add SPI support
>    ARM: dts: suniv: licheepi-nano: add SPI flash
>    ARM: configs: sync multi_v5_defconfig from savedefconfig
>    ARM: configs: multi_v5: Enable Allwinner F1C100
> 
> Jesse Taube (4):
>    ARM: dts: suniv: F1C100: add clock and reset macros
>    dt-bindings: mmc: sunxi: add Allwinner F1c100s compatible
>    ARM: dts: suniv: F1C100: add MMC controllers
>    ARM: dts: suniv: licheepi-nano: add microSD card
> 
>   .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>   .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |   3 +
>   .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   1 +
>   .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +-
>   .../boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
>   arch/arm/boot/dts/suniv-f1c100s.dtsi          | 102 ++++++++++++++++--
>   arch/arm/configs/multi_v5_defconfig           |  25 ++---
>   7 files changed, 140 insertions(+), 29 deletions(-)
> It boots fine and SPI flash and MMC are found. Time keeping also works.
I didn't use the multi_v5_defconfig though.

