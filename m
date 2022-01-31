Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08ED2CA1
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 18:40:47 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id v74so13633791pfc.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vUcVq5xhDtsVnawQOYBHe0I2uMjtSwKHFuB7P9A9ZPE=;
        b=Qks15jLuTdFfJB7Yimcf6CFubiKZSrG+lgYbEXhv5CmcREhbsO9I3sHSkFpZJtXCKr
         92ULlrJ1jbtZTyDNycEEatYwo/lYVGPSpPf1Eb96b6UbfuVheN/P13CAiMWNG2SWTU/7
         3kMaW8gywhhLuK1ffBR6cWAnDfHfkbkT4gdENSpeUmj5WtcK+xKXA3d7Ir+6P1b6ySez
         5aKGnhEZanxzbauIs3sIeQq7luxkHgr8QY9yfq7EiP8YuRrN+QQlfEvf8cqeTrWlxUPM
         eHVw4/o/IfeCDvEz6RYo2vuKGwnbY5xuw8UU3STuPVmvw/DN71+Hg6YDgx6nHJknnlYG
         GImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vUcVq5xhDtsVnawQOYBHe0I2uMjtSwKHFuB7P9A9ZPE=;
        b=DTWPy6K6F4g24WzKDA3Esdt6DB3PTkSMoBS9sDYo/OFvrlkeA26pxB+ep3L0ukrzFS
         atW/Tkn+CKnqHDCzr7qlje3inJW96D8Ho9b+a1z2yCrNgjEQDQOA7Cb31tBhZgZ+ZKpv
         m0gsqkHB1hSBoERFUxAuYoX0s8NqxEskcwLxDZvDcTxEEMzRWJLH9JR6Y3o0Ab1DBH5O
         DyrXOpl56NEByS2qxA4+GWDa7hiv1wcoXRK+aCDEjY+TbiNuyaK/u12B5/UBto9Chq6P
         LJByUb2fNtDZzm59tf6d1X/mAdiphlMwHka3CDm71nT63zoWAWsAdHrOIQwBWONu1s9N
         Fclg==
X-Gm-Message-State: AOAM533JQo+CGvqVra2TgKMxJMQoB+Nx01pZgnt6x+4ArjQL6gWhlRw+
	0RHpriIJQOEywWkCtN+sLOo=
X-Google-Smtp-Source: ABdhPJwFcPJi/t2hparKLY2t08LTiTgjCaME1xBLmUfnatI03eGBlVkElbTxSt6cAsqmyFb4Kfa8FA==
X-Received: by 2002:a05:6a00:b51:: with SMTP id p17mr12524853pfo.35.1643654447151;
        Mon, 31 Jan 2022 10:40:47 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id s14sm18562705pfk.65.2022.01.31.10.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 10:40:45 -0800 (PST)
Message-ID: <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
Date: Mon, 31 Jan 2022 10:40:38 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH net-next] net: kbuild: Don't default net vendor configs to
 y
Content-Language: en-US
To: Saeed Mahameed <saeedm@nvidia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 Saeed Mahameed <saeed@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Mark Einon <mark.einon@gmail.com>,
 Lino Sanfilippo <LinoSanfilippo@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Chris Snook <chris.snook@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jeroen de Borst <jeroendb@google.com>, Catherine Sullivan
 <csully@google.com>, David Awogbemila <awogbemila@google.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jon Mason <jdmason@kudzu.us>, Simon Horman <simon.horman@corigine.com>,
 Rain River <rain.1986.08.12@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, drivers@pensando.io,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jiri Pirko <jiri@resnulli.us>,
 Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andy Gospodarek <andy@greyhouse.net>,
 Michal Simek <michal.simek@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Vegard Nossum <vegard.nossum@oracle.com>, Rob Herring <robh@kernel.org>,
 l.stelmach@samsung.com, rafal@milecki.pl,
 Edwin Peer <edwin.peer@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Chan <michael.chan@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Marcin Wojtas <mw@semihalf.com>, Oleksij Rempel <linux@rempel-privat.de>,
 Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Slark Xiao <slark_xiao@163.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Liming Sun <limings@nvidia.com>, David Thompson <davthompson@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Omkar Kulkarni <okulkarni@marvell.com>, Shai Malin <smalin@marvell.com>,
 Randy Dunlap <rdunlap@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Gary Guo <gary@garyguo.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220131172450.4905-1-saeed@kernel.org>
 <20220131095905.08722670@hermes.local>
 <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
 <20220131183540.6ekn3z7tudy5ocdl@sx1>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220131183540.6ekn3z7tudy5ocdl@sx1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/31/2022 10:35 AM, Saeed Mahameed wrote:
> On 31 Jan 19:30, Geert Uytterhoeven wrote:
>> On Mon, Jan 31, 2022 at 6:59 PM Stephen Hemminger
>> <stephen@networkplumber.org> wrote:
>>> On Mon, 31 Jan 2022 09:24:50 -0800
>>> Saeed Mahameed <saeed@kernel.org> wrote:
>>>
>>> > From: Saeed Mahameed <saeedm@nvidia.com>
>>> >
>>> > NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
>>> >
>>> > Since all drivers belonging to a vendor are supposed to default to 
>>> 'n',
>>> > defaulting all vendors to 'n' shouldn't be an issue, and aligns well
>>> > with the 'no new drivers' by default mentality.
>>> >
>>> > Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>>>
>>> This was done back when vendors were introduced in the network 
>>> drivers tree.
>>> The default of Y allowed older configurations to just work.
>>
>> And changing the defaults means all defconfigs must be updated first,
>> else the user's configs will end up without drivers needed.
>>
> 
> As I understand correctly, at least for most common net drivers, having 
> NET_VENDOR_XYZ=y doesn't actually build anything, we have flags per
> module for each vendor and those are defaulted to N.

Right, but once you start hiding NET_VENDOR_DRIVER_XYZ under a 
NET_VENDOR_XYZ Kconfig symbol dependency, if NET_VENDOR_XYZ is not set 
to Y, then you have no way to select NET_VENDOR_DRIVER_XYZ and so your 
old defconfig breaks.

> 
>>> So there was a reason, not sure if it matters anymore.
>>> But it seems like useless repainting to change it now.
>>
>> It might make sense to tune some of the defaults (i.e. change to
>> "default y if ARCH_*") for drivers with clear platform dependencies.
>>
> 
> either set hard default to 'n' or just keep it as is, anything else is just
> more confusion.

Maybe the rule should go like this: any new driver vendor defaults to n, 
and existing ones remain set to y, until we deprecate doing that and 
switching them all off to n by 5.18?
-- 
Florian
