Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E45127
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Mar 2022 20:42:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id r67-20020a1c4446000000b00389d73ceb43so680707wma.4
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Mar 2022 12:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=aSOCxd0O0AlSABEw2+WmMslTuNXzOT8psYUKdCBZjow=;
        b=iDcQWsrBUQBbOYpkdV/CKJL8qJq5WWMmLaX1Qzg+fJOoD2jytPJDY7x1Az2iaD1WIP
         UOXtgCvsRC8f4nVQFEO6lUFkEWq2gsgVHQ5q9RSXlcJUNj8cxEVoXBKDLazyevhQYLZq
         ce/g6buwwH7nstsQOJkuU1tk3Zl7BaLGCIEovkxHTpISFK+W4DowavUXX6bqokYAykWu
         lEDwcAOkIn22scFP/WqhKCep3FLwxOW75H5aQHsWeKbFXSvYXbg0eBK4K2/sZYn4uwi5
         h10BTo9eBedCvGMAJE4YgRvhm2efV+HnZXG+gCXZEVHiYYG1USxmldmohtySVC+pX+1F
         yYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=aSOCxd0O0AlSABEw2+WmMslTuNXzOT8psYUKdCBZjow=;
        b=NMyIH6VpB5NwRalwW56WUbwrVDvsvf3Zq+jwWHc6zqtiQbItD39S7O0kvCkPLFk7B/
         nNt6+a67eyTrq6N/QJHh/YmzP1q7sjO2GQBA2WIgTZ3a3hNzNQyfFBpoOFcngFS7JpA/
         w7Wx7OVrAOkb9DcfARXrcjW6CE70WiEk4f/ZFi5Q9ckXfmjR4QW9CmLoLNRomyweanR4
         Tl+7OzmgppkF7AU4hkMuEQs2t5kwVsgy+bFQwYAz3b17V2vVTKJZic94vWoi54XOOvtO
         ZoGol6eDkixsetc59E/ra/E+6+89UcVRY6TqYzaEEL1OfKtCRIEVlBIQ3dVEhX1SonJf
         uFQg==
X-Gm-Message-State: AOAM530TTzvoqDpAKKz5MNeUHXDp3et7NfffI4FIbS8Vy3Np0KSd/5fS
	J/gisnk4ttQ8RsLJ1z123Ck=
X-Google-Smtp-Source: ABdhPJyOGhORUyM5EXeW2PmVMEuYS8h2EGD1SJyFy4GGHmjvmuDHXyH+wyKl36U7mJjN9GdoJ0W6CA==
X-Received: by 2002:a7b:c114:0:b0:381:f7ee:e263 with SMTP id w20-20020a7bc114000000b00381f7eee263mr9091536wmi.30.1646858530342;
        Wed, 09 Mar 2022 12:42:10 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c? (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de. [2a01:c22:7793:600:9d6a:7788:3389:da6c])
        by smtp.googlemail.com with ESMTPSA id j15-20020a05600c410f00b00389d35f7624sm2351990wmi.0.2022.03.09.12.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 12:42:09 -0800 (PST)
Message-ID: <44006194-eab1-7ae2-3cc8-41c210efd0b1@gmail.com>
Date: Wed, 9 Mar 2022 21:42:05 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Erico Nunes <nunes.erico@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
 <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
 <1e828df4-7c5d-01af-cc49-3ef9de2cf6de@gmail.com>
 <1j8rts76te.fsf@starbuckisacylon.baylibre.com>
 <a4d3fef1-d410-c029-cdff-4d90f578e2da@gmail.com>
 <CAK4VdL08sdZV7o7Bw=cutdmoCEi1NYB-yisstLqRuH7QcHOHvA@mail.gmail.com>
 <435b2a9d-c3c6-a162-331f-9f47f69be5ac@gmail.com>
 <CAK4VdL28nWstiS09MYq5nbtiL+aMbNc=Hzv5F0-VMuNKmX9R+Q@mail.gmail.com>
 <1j5yonnp1a.fsf@starbuckisacylon.baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
In-Reply-To: <1j5yonnp1a.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.03.2022 15:57, Jerome Brunet wrote:
> 
> On Wed 09 Mar 2022 at 15:45, Erico Nunes <nunes.erico@gmail.com> wrote:
> 
>> On Sun, Mar 6, 2022 at 1:56 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>> You could try the following (quick and dirty) test patch that fully mimics
>>> the vendor driver as found here:
>>> https://github.com/khadas/linux/blob/buildroot-aml-4.9/drivers/amlogic/ethernet/phy/amlogic.c
>>>
>>> First apply
>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=a502a8f04097e038c3daa16c5202a9538116d563
>>> This patch is in the net tree currently and should show up in linux-next
>>> beginning of the week.
>>>
>>> On top please apply the following (it includes the test patch your working with).
>>
>> I triggered test jobs with this configuration (latest mainline +
>> a502a8f0409 + test patch for vendor driver behaviour), and the results
>> are pretty much the same as with the previous test patch from this
>> thread only.
>> That is, I never got the issue with non-functional link up anymore,
>> but I get the (rare) issue with link not going up.
>> The reproducibility is still extremely low, in the >1% range.
> 
> Low reproducibility means the problem is still there, or at least not
> understood completly.
> 
> I understand the benefit from the user standpoint.
> 
> Heiner if you are going to continue from the test patch you sent,
> I would welcome some explanation with each of the changes.
> 
The latest test patch was purely for checking whether we see any
difference in behavior between vendor driver and the mainlined
version. It's in no way meant to be applied to mainline.

> We know very little about this IP and I'm not very confortable with
> tweaking/aligning with AML sdk "blindly" on a driver that has otherwise
> been working well so far.
> 

This touches one thing I wanted to ask anyway: Supposedly Amlogic
didn't develop an own Ethernet PHY, and if they licensed an existing
IP then it should be similar to some other existing PHY (that may
have a driver in phylib).

Then what I'll do is submit the following small change that brought
the error rate significantly down according to Erico's tests.

-       phy_trigger_machine(phydev);
+       if (irq_status & INTSRC_ANEG_COMPLETE)
+               phy_queue_state_machine(phydev, msecs_to_jiffies(100));
+       else
+               phy_trigger_machine(phydev);


> Thx
> 
>>
>> So at this point, I'm not sure how much more effort to invest into
>> this. Given the rate is very low and the fallback is it will just
>> reset the link and proceed to work, I think the situation would
>> already be much better with the solution from that test patch being
>> merged. If you propose that as a patch separately, I'm happy to test
>> the final submitted patch again and provide feedback there. Or if
>> there is another solution to try, I can try with that too.
>>
>> Thanks
>>
>>
>> Erico
> 

Heiner
