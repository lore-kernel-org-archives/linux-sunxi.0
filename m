Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB472C9D
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 11:02:51 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
	by Aruba Outgoing Smtp  with ESMTPA
	id EUDgnsLSo4NL9EUDhnFMul; Mon, 31 Jan 2022 11:47:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1643626060; bh=o7aD01LnNWb+6th66pKYy28l6A6tKDA4zSw4WPvgqQE=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=cKmFphcZCrMIr/PZwglf/rQ59pFO1PWgdhc+YO9VxnXf8RKbU93/WZ8k5TLNhexqG
	 DhpHq52BxfWwUUzyfjT/HFtD3RUsr/Z+9Yu1HSA8fuRWgXN/Z4fda+QyWJcxm2hGiR
	 Xzyb6ucAzInJrCBKi/RkIS1Ag1Vkcy/kxwJvth5BFAmY1TaCwk4S4MC5cLx6iajYmr
	 x+b3Z3lZ0dvd50BIFleTfCTMQv20gXzrpi97s9yaox2xqkWgDjxdSP+4c7DVnKso+n
	 /WDq6ifzh24OrCEpiVbjGJaowL9DcXPCYf5Ls7bgF3QmsZT3IZ4AiKQEOMDdDn6qvO
	 7KIssdbqhHPiw==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Please test U-Boot Allwinner F1C100s support
Date: Mon, 31 Jan 2022 11:47:36 +0100
Message-Id: <05FF11BA-A37F-4A89-A30B-96EDA15DD469@benettiengineering.com>
References: <2ba1e2bb-e65d-8b79-dad9-1698b2dc6d12@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
In-Reply-To: <2ba1e2bb-e65d-8b79-dad9-1698b2dc6d12@gmail.com>
To: Jesse Taube <mr.bossman075@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfJGr+scd0YT9yTf7HOFjZIe5NRLNzZaKJombFHH44O+DXjc4lIDl09Pnnxb5mBthoU0oWAGRPfEwTwiGnHygdUVmakP/yCJBa1ONg+uOsytZO0G288zm
 +hQYjXJ/uRVkxrNxWj1g78BNgsJo8vE8kGxuKDh1ZqcfubzsbnEWh9YV2Wg1BjFk5hxg5RH1hgxegx3SKEjlBOsp9UuY+cTISS+bpzelhVajbE4xU2q3LFPr
 QdTRK9q3hNfJoqPFpuj2T5KcKF4gqq/n+1a/4EZbSqQT0Waic532Rsc5pcYC7CqncdLGO6VbaFdxkGdz8HX5EMJCzfP9lLlMJR/2d0CupftJ6FpdW0mQ3xuf
 4/7ZBSKRPgN4huO+GPazxsu8OE6TMkTmCptOIvbxGtd+RNFvr4RGnSJ1pP0sT8CPSUxPgaR5

Hi Andre and Jesse,

I test it today on both F1C100s and F1C200s!
Lichee Pi Nano and the Jesse=E2=80=99s board with F1C200s.

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

> Il giorno 31 gen 2022, alle ore 03:12, Jesse Taube <mr.bossman075@gmail.co=
m> ha scritto:
>=20
> =EF=BB=BF
>=20
>> On 1/30/22 21:04, Andre Przywara wrote:
>> Hi,
>> thanks to the tireless work of Jesse, I think the basic Allwinner
>> F1C100s support for mainline U-Boot is now ready to be merged. Since I
>> don't have the hardware, can any of you who have boards please give it a
>> try on their hardware? I would really love to see some confirmations
>> before I merge it.
>=20
> I really have to thank you for reviewing!
>=20
>> I put a branch here:
>> https://source.denx.de/u-boot/custodians/u-boot-sunxi/-/tree/f1c100s
>> This should probably work on any F1C100s board, using the LicheePi Nano
>> defconfig. Also curious about the F1C200s (looking at you, George ;-)
>=20
> I have tested on both. Giulio has them aswell now.
>=20
>> This is very basic support at this point, there is no USB or SPI
>> support, and even the SD card is not usable from U-Boot proper.
>=20
> Sd card will work if we add it to the dts.
>=20
>> I am hopeful we can add MMC and SPI support still in this cycle, but I do=
n't
>> want to hold back this series any longer, and it should be relatively
>> simple support patches.
>=20
> I have patches for both spi-boot and U-Boot proper spi suport.
> I did manage to get it to find the boot device with:
> `u32 brom_call =3D *(u32*)(fel_stash.sp-4);` in mach-sunxi/board.c with th=
e suggestion that Stephen said. Should I submit after it gets into master or=
 is tomorrow fine.
>=20
> Many thanks,
>    Jesse Taube
>> What should work though is booting via FEL and from SD card (the SPL
>> MMC code is in place, if I am not mistaken). Just booting it to a U-Boot
>> prompt via both methods would be a great test already. Maybe you can
>> even upload a kernel and initrd via FEL and boot it from there, using
>> $fdtcontroladdr for the DT address, for instance.
>> Any replies would be highly appreciated!
>> Many thanks,
>> Andre

