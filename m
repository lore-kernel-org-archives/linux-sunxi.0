Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52720F8
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Dec 2023 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="D0U0HI2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703416664; x=1704021464; i=wahrenst@gmx.net;
	bh=JWZ+8g5eZNOh20k52eUqOz4WDMv4KYT+Ma3ruBXDwk4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=D0U0HI2OZqDT/Zf6MDxiiSZ5F3qJ5QCu3HIiYZW+ZCIs+kSzSlVJ4R0Z0p9hTEAk
	 PAxMNWynPsRS3rLh4dRpLzGOHMopPdy0k8yveYUIbFK3Eh7scEqMOuYYUoyRiKReY
	 7L0Jo3BX6albQzVaUffNMVK+qLL3L/SxITZiMvIhWFcfaBKkct0Yveg7TiEnzULrT
	 +o5xMi2DSyHp7McBdtdEGHEbfdPwsR97VWV6bQ/beADeZZFUe6yVKtg8Od4AJXZtR
	 0l0vHltbR8C2wcQJG9o8SD5EpRnhwNSWpNAQDzWN9DziDons6C39Aqm4X/Ax/PvGN
	 +uQwiZoxOcv2/pm76w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSt8W-1rhK8U3TTC-00UHjs; Sun, 24
 Dec 2023 12:17:44 +0100
Message-ID: <44838edf-a7c7-4563-b9ea-b874dc3a1698@gmx.net>
Date: Sun, 24 Dec 2023 12:17:42 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: sun9i: smp: Fix array-index-out-of-bounds read in
 sunxi_mc_smp_init
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>,
 linux-sunxi@lists.linux.dev, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org
References: <20231223123546.88125-1-wahrenst@gmx.net>
 <17bfb503-9e6a-40c7-b9fa-fc89c8a903c9@gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <17bfb503-9e6a-40c7-b9fa-fc89c8a903c9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JLSVgLuLUmLFWRh6IJTAltUlcax0zxap1vQ0odssACh4KO5xlCR
 c4s1O57jo+NOAzxOXjaF75sMd5e+6uOEDU7ZUlE+HL5T5fyNkqCiVVI9yQywUGgNl1Pkw6h
 DlelRwOn6cNBPPPVucAboK7ozoUhhOOtrLX2j91q6MmJ38BxbdI+Dg9ymjFIebCuTe8Oy5x
 2neL5GfwXS8moo5sawxFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JZ9lhrLJU/M=;C/SVdbRFQcsjQf1dpsTa4bZU2Q4
 E4NizFWTifE9oSEBi9ct5xT+5KdhhrSuSPX5bHUkjb9utyy8cDrcFhKf9I8X+Ca4R9yD46o5d
 z96D9uCT88AHbDWpQ+D1Ic3jv1OGdigjsTWgFSIgEfaeTU/f/w/RrLWq0E3qAvpcL4duvxwPP
 aCF90FYpAtm+EL/8aznaGMlMyLH2Sri2ZN7/9T2Vg6onhld/1L2Ji7UcKHgEZnfw/B1ItMsKm
 HW/fpf+vxRMIsQSx432SGsNKjOSgFXoQv/CXsxLUQzdu7pRvQXziZsBjjKZXRy81+pQvq9UGa
 LbTLGyPYmHKA3PHwuQSSK63SUXgb8g5NIf+uP5GQluE3qfBn8Y9irP62CcId2r2vHJk6wimvE
 6m0Yoka7qGn934VHAbFKhBSOXT2mKXwQoEx/9Llz6YwPyA6k9gjqZegWltF7X/E5aw7Khe9UX
 h9sBwr4pNmSncNmvIIi9pdy9WCdblj8LYy6Bi/8HJ3eagyx+jO9JTwaxlrtQ22sdpQRA9g8Aw
 UKWB0UYiPYcvxbhBiUopVG73fxrybLPZonySGnQj/nx5Wz45JObN1RFCzlAzyYume6LqWyyrc
 CelN6QNTPPQt47f/wHGE+iuYN3y/vcBFlQI8ZYqq0IOzpiFWVonCYR6Aj70cFDBiaTu/0Dxb6
 A+sy1/FH631sG2/hwvKmtFLrfIMorh5o4Zt6aEiGaPJiAFATC4JCV8q/TMcxFNgTXqEgApDzU
 KxOYz1Es1AfCG1mpKQDNshhJjvygt5Z0yUj5WXqOWoCHoJz5tHQlgx+1E3bQGALVEOkY3M1pN
 oDpwwjMzg7IGFUBiANu9PVh4ix7JKP8oKH1qj2m16RPO92PaVAaA3htVQ+wAUde4vbSJQ9OHi
 fiexneKDn+DUVZ2oqWwTlyvDr6Q6LDw3OznGtbRhDFPr/i/ZlKlyo8ieejvAlcy15QzGdpu1O
 nAyQgw==

Hi Florian,

Am 24.12.23 um 11:12 schrieb Florian Fainelli:
>
>
> On 12/23/2023 1:35 PM, Stefan Wahren wrote:
>> Running a multi-arch kernel (multi_v7_defconfig) on a Raspberry Pi 3B+
>> with enabled CONFIG_UBSAN triggers the following warning:
>>
>> =C2=A0 UBSAN: array-index-out-of-bounds in
>> arch/arm/mach-sunxi/mc_smp.c:810:29
>> =C2=A0 index 2 is out of range for type 'sunxi_mc_smp_data [2]'
>> =C2=A0 CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 6.7.0-rc6-00248-g5254c0cbc92d
>> =C2=A0 Hardware name: BCM2835
>> =C2=A0=C2=A0 unwind_backtrace from show_stack+0x10/0x14
>> =C2=A0=C2=A0 show_stack from dump_stack_lvl+0x40/0x4c
>> =C2=A0=C2=A0 dump_stack_lvl from ubsan_epilogue+0x8/0x34
>> =C2=A0=C2=A0 ubsan_epilogue from __ubsan_handle_out_of_bounds+0x78/0x80
>> =C2=A0=C2=A0 __ubsan_handle_out_of_bounds from sunxi_mc_smp_init+0xe4/0=
x4cc
>> =C2=A0=C2=A0 sunxi_mc_smp_init from do_one_initcall+0xa0/0x2fc
>> =C2=A0=C2=A0 do_one_initcall from kernel_init_freeable+0xf4/0x2f4
>> =C2=A0=C2=A0 kernel_init_freeable from kernel_init+0x18/0x158
>> =C2=A0=C2=A0 kernel_init from ret_from_fork+0x14/0x28
>>
>> Since the enabled method couldn't match with any entry from
>> sunxi_mc_smp_data, the value of the index shouldn't be used right after
>> the loop. So move it after the check of ret in order to have a valid
>> index.
>>
>> Fixes: 1631090e34f5 ("ARM: sun9i: smp: Add is_a83t field")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> Previous attempts at fixing this:
>
> https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@google.com=
/T/
thanks for pointing out. Nick's version missed the refcounting of node
and my version missed the proper handling of of_property_match_string.
So we have actually two issues in the original code.

I will prepare a second version.

Nevertheless merry x-mas
>
> including a patch from William from nearly 18 months ago, which was
> not captured by lore however.
>
> Is anyone collecting patches for that platform still?

