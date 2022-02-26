Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C13B3C
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Feb 2022 13:53:19 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id qk11so16182045ejb.2
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Feb 2022 05:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TsaRuVxv1wxficHnGYSa67ZI4zBhTgO9xNnzgVV8QDk=;
        b=qrp0aDcJ00HkkXmlwjmV2fNPaaqFpM8LSOTnVMf+l/TPbCqYR02/KwpEAse2KdR72W
         3Yj399GrdX6rVZMHICKfBLtesL3Dx9efa3kmyx28v9ftlhWhV1KYAddUxK4pJM+Ygzom
         iU1e0HVTxJiGTQwcYz/LxIFH0MmTxZcifC27WT4/4RcuI2ZVZpAYv6wvAh7JdITvlj3z
         3h2/pAGK4uAqd2YzsB5oh2tG3HGWHBGdqiPrG3QoFI7YMwgtjDdvIjpMsAFHfj66SDID
         hFRGE6sPHygzZqMEZHcVE4WmdGnEwolRnuWFrVtljrVYrFgdD60Wykj4KBe4SBntzLmD
         Qu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TsaRuVxv1wxficHnGYSa67ZI4zBhTgO9xNnzgVV8QDk=;
        b=WXm3wFwZLeXOaDa5fjDuiysohTVLftRQh7yBb/+SV1KVqBtNRtx/QO0rbxSE/Xj198
         HvfIdWz+x8WMb4DIUIzzulTH9qy3htsQf1BCOJmcFEGnmiHmUGNAszkK6amkypXHXSOJ
         RuWemEeTwMRITnOareif1r53HXjWzzwyQZWdTA+jvj9KNxAAhi8sQc57G7xXKgbxed7g
         I2TL8Q0ucaHj6ezRt3iForbmhhjyb9DV9o/gl7AVlv7YeAMxV7gIHH93eGqf/unET3Pu
         YI4cX0sSnIJ9IsDrwlL3dkR+QaBalSC64UW1GvioMTc9Tql86BG1LeyJDwzVkjfupwtW
         yAQg==
X-Gm-Message-State: AOAM531ht02yv3V3tB9+m59JxtppDpHDYOB0822GaDD0wEW8t3ud7Rzb
	yOIww+iDGqrJkPpTL7hNFrU=
X-Google-Smtp-Source: ABdhPJwiVJfLvdZccLYhEgNecpN6joGfd7tTOf8wfLQwHfy/palwOsd49LQuJ8T2p2KZeXIzPw1hvw==
X-Received: by 2002:a17:906:4ad9:b0:6cf:93f:f77e with SMTP id u25-20020a1709064ad900b006cf093ff77emr9767882ejt.558.1645883597916;
        Sat, 26 Feb 2022 05:53:17 -0800 (PST)
Received: from ?IPV6:2a01:c23:c13e:d400:a0fb:f10a:2c79:ae2c? (dynamic-2a01-0c23-c13e-d400-a0fb-f10a-2c79-ae2c.c23.pool.telefonica.de. [2a01:c23:c13e:d400:a0fb:f10a:2c79:ae2c])
        by smtp.googlemail.com with ESMTPSA id l18-20020a1709067d5200b006cb0ba8db9esm2305765ejp.14.2022.02.26.05.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 05:53:17 -0800 (PST)
Message-ID: <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
Date: Sat, 26 Feb 2022 14:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2022 17:51, Erico Nunes wrote:
> On Mon, Feb 7, 2022 at 11:56 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Wed 02 Feb 2022 at 21:18, Erico Nunes <nunes.erico@gmail.com> wrote:
>>
>>> Hello,
>>>
>>> I've been tracking down an issue with network interfaces from
>>> meson8b-dwmac sometimes not coming up properly at boot.
>>> The target systems are AML-S805X-CC boards (Amlogic S805X SoC), I have
>>> a group of them as part of a CI test farm that uses nfsroot.
>>>
>>> After hopefully ruling out potential platform/firmware and network
>>> issues I managed to bisect this commit in the kernel to make a big
>>> difference:
>>>
>>>   46f69ded988d2311e3be2e4c3898fc0edd7e6c5a net: stmmac: Use resolved
>>> link config in mac_link_up()
>>>
>>> With a kernel before that commit, I am able to submit hundreds of test
>>> jobs and the boards always start the network interface properly.
>>>
>>> After that commit, around 30% of the jobs start hitting this:
>>>
>>>   [    2.178078] meson8b-dwmac c9410000.ethernet eth0: PHY
>>> [0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
>>>   [    2.183505] meson8b-dwmac c9410000.ethernet eth0: Register
>>> MEM_TYPE_PAGE_POOL RxQ-0
>>>   [    2.200784] meson8b-dwmac c9410000.ethernet eth0: No Safety
>>> Features support found
>>>   [    2.202713] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
>>>   [    2.209825] meson8b-dwmac c9410000.ethernet eth0: configuring for
>>> phy/rmii link mode
>>>   [    3.762108] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
>>> 100Mbps/Full - flow control off
>>>   [    3.783162] Sending DHCP requests ...... timed out!
>>>   [   93.680402] meson8b-dwmac c9410000.ethernet eth0: Link is Down
>>>   [   93.685712] IP-Config: Retrying forever (NFS root)...
>>>   [   93.756540] meson8b-dwmac c9410000.ethernet eth0: PHY
>>> [0.e40908ff:08] driver [Meson GXL Internal PHY] (irq=48)
>>>   [   93.763266] meson8b-dwmac c9410000.ethernet eth0: Register
>>> MEM_TYPE_PAGE_POOL RxQ-0
>>>   [   93.779340] meson8b-dwmac c9410000.ethernet eth0: No Safety
>>> Features support found
>>>   [   93.781336] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
>>>   [   93.788088] meson8b-dwmac c9410000.ethernet eth0: configuring for
>>> phy/rmii link mode
>>>   [   93.807459] random: fast init done
>>>   [   95.353076] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
>>> 100Mbps/Full - flow control off
>>>
>>> This still happens with a kernel from master, currently 5.17-rc2 (less
>>> frequently but still often hit by CI test jobs).
>>> The jobs still usually get to work after restarting the interface a
>>> couple of times, but sometimes it takes 3-4 attempts.
>>>
>>> Here is one example and full dmesg:
>>> https://gitlab.freedesktop.org/enunes/mesa/-/jobs/16452399/raw
>>>
>>> Note that DHCP does not seem to be an issue here, besides the fact
>>> that the problem only happens since the mentioned commit under the
>>> same setup, I did try to set up the boards to use a static ip but then
>>> the interfaces just don't communicate at all from boot.
>>>
>>> For test purposes I attempted to revert
>>> 46f69ded988d2311e3be2e4c3898fc0edd7e6c5a on top of master but that
>>> does not apply trivially anymore, and by trying to revert it manually
>>> I haven't been able to get a working interface.
>>>
>>> Any advice on how to further debug or fix this?
>>
>> Hi Erico,
>>
>> Thanks a lot for digging into this topic.
>> I'm seeing exactly the same behavior on the g12 based khadas-vim3:
>>
>> * Boot stalled waiting for DHCP - with an NFS based filesystem
>> * Every minute, the network driver gets a reset and try again
>>
>> Sometimes it works on the first attempt, sometimes it takes up to 5
>> attempts. Eventually, it reaches the prompt which might be why it went
>> unnoticed so far.
>>
>> I think that NFS just makes the problem easier to see.
>> On devices with an eMMC based filesystem, I noticed that, sometimes, I
>> had unplug/plug the ethernet cable to make it go.
>>
>> So far, the problem is reported on all the Amlogic SoC generation we
>> support. I think a way forward is to ask the the other users of
>> stmmac whether they have this problem or not - adding Allwinner and
>> Rockchip ML.
>>
>> Since the commit you have identified is in the generic part of the
>> stmmac code, Maybe Jose can help us understand what is going on.
> 
> Hi all,
> 
> thanks for the feedback so far, good to know that this is not only on
> my board farm.
> 
> Any more feedback about this from the people in cc?
> 
> Thanks
> 
> Erico

Just to rule out that the PHY may be involved:
- Does the issue occur with internal and/or external PHY?
- Issue still occurs in PHY polling mode? (disable PHY interrupt in dts)
