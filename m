Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4692F2C80
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 23:20:05 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 133so13699780pgb.0
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 15:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hnC6Z6Q65VdAgTCIurldNfb7wdu2fNyh9pkO9iIDICk=;
        b=Z5MZq2xNg6nMK1mXw+qO2hcJb3Tz4m7kBDjuxolAyGm+4ubLMy6tQDcyBNzElWZSOd
         G5ecbnM5ar7DLV4W+1emFpS7l5EuuqTtBOj5Naxzs89K8S1+lBafQ7jVn+SL5sIl+Suk
         GA8R1h/dXiKQ7aMypq+MkTbEaabr4UHQwGq/UcyD6M4vfwOyC1nGKKaNC4v1imW8fOUv
         TldBMFlAZ9/MQsgrPJoHDkxlJpN+iBcUTAYzc4Hi6K0YGjkiVwICUx2igdu6DV8OLYD5
         FpnItpUdFsMgTGoqi2w89mGkRM+mIinMfgGeMKeePKlNdT6+SLsReDrcqTEfHkU3QuaA
         UJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hnC6Z6Q65VdAgTCIurldNfb7wdu2fNyh9pkO9iIDICk=;
        b=59yKPz3IEQnjy00CO8AB63gTyVagakUU6mdVvvIojmECIprGAlQoSJDy++QKraNNje
         la5cgTvzwy82Wd86S0p/28y/05zBuV/P93vzN2qZYcEwfytPBIuwYwavnj8lwTVpf9ki
         EcSETbp8flJSMLyLSvW+GLJlIFMMw8asXHFjHgaPYqUuaXom54527J8IsQlv1n4OTlEh
         MRPf+2PaZOQ7pZxxdK0kIaFN7q5EeI2kMAXcrfWGjF4AOJThy3ZvelCf+ItGFWfOmg7W
         6dYZSnhiV9B0Quy9+gn/n9PuwhkFDwwMpSBI+y4irFKrasXRY5+2o+SQRy7ICLJ2BUg5
         so+g==
X-Gm-Message-State: AOAM532ufQxPnaFdhNpi6XyFTyd8vQbMQoHW/izOwzuAiudHRtQj49K7
	j3d72HMnJeOo/mP/flUWEHE=
X-Google-Smtp-Source: ABdhPJycbTtXw2lmt7UbWvdEsej8/fkc3gFa/rosbqIgkbMppZhW1w32qbf2yIx+skbzfEUc4SpUew==
X-Received: by 2002:a63:c156:: with SMTP id p22mr18269679pgi.215.1643671204652;
        Mon, 31 Jan 2022 15:20:04 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id u19sm19919367pfi.150.2022.01.31.15.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 15:20:04 -0800 (PST)
Message-ID: <dd1497ca-b1da-311a-e5fc-7c7265eb3ddf@gmail.com>
Date: Mon, 31 Jan 2022 15:19:58 -0800
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Saeed Mahameed <saeed@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Mark Einon <mark.einon@gmail.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
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
 <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
 <20220131121027.4fe3e8dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <7dc930c6-4ffc-0dd0-8385-d7956e7d16ff@gmail.com>
 <20220131151315.4ec5f2d3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220131151315.4ec5f2d3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/31/2022 3:13 PM, Jakub Kicinski wrote:
> On Mon, 31 Jan 2022 15:06:01 -0800 Florian Fainelli wrote:
>>>> Right, but once you start hiding NET_VENDOR_DRIVER_XYZ under a
>>>> NET_VENDOR_XYZ Kconfig symbol dependency, if NET_VENDOR_XYZ is not set
>>>> to Y, then you have no way to select NET_VENDOR_DRIVER_XYZ and so your
>>>> old defconfig breaks.
>>>
>>> To be clear do we actually care about *old* configs or *def* configs?
>>
>> I think we care about oldconfig but maybe less so about defconfigs which
>> are in tree and can be updated.
> 
> The oldconfigs would have to not be updated on any intervening kernel
> in the last 10+ years to break, right? Or is there another way that an
> oldconfig would not have the vendor config set to y at this point?

That sounds very unrealistic, so yes, I don't think at this point that 
would happen. Even if you had your 15 year old .config file and ran make 
oldconfig today, you would have some work to do to make sure it still 
runs on your hardware.
-- 
Florian
