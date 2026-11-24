Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531369;
	b=FjZ/41Mmv59f2oQB3m2FboYby+O/kydMZ8RWKOp2fWW0ta4QA2TwNeXfJ7x5YF+0FQBT
	 aLozsA+9wKaEd8crgZBfkWOkK9cIbjoyA6Ctq0HABHcfTw+wwrFN99iWTRcyR3xV9rXhB
	 olatVN29CwIsteS+BJsxxdoSzw2ULwsNGkG5xO3FHx70SDCMc3GiZxRPv7Cj6t7ZCI93A
	 v1jyHqupeQ6ov/D6NoGz9c2izxECpXR2CuPv+JUyvGIsVHg6moKD2g+T9pdWSGhKGs7Uj
	 xiI35Hl47831Y8F00/PNiY2LAa4Ty17k9LWOkO0npw/ywFU+vABv+PQo3EGUgB78wPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531369;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=whpdiooOdtf0fQpB9RYBhngBI1Ig6SjjoowNuFUHFpk=;
	b=gytppfaGsu2ruFihhNgWoE2F9TlwcVchW95qxClFFsKV2RPxqGZuEF/AX5Ei02z3TJXT
	 qA20gf81cG51BONo5Q8RYA3+LmVKWdXXCkLaGI7IoQLfg+iHNBAZL5kaedBuJjBDJtnE3
	 hl++9TEN1t18hTfL7PVQRAYy0k2LCGYm0IPvbvg1FKyOjpF2hkqfdpFIiUtcfCXdnOpkx
	 pf2kvx5YomSMNIOfjcsUFX/Js5L1vB5ZGPkZA1q8wz3g+MUOMLNq7PDYbDrubRnd+bB0S
	 UlWhRQXWvHRfKku4CpBOAvkF/LwOLj2azVP8o+8zjGfPeqG5RSC6DVJCWQqWnFSvB7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDdLoFoN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B87606A31E
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 14:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B87606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDdLoFoN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB703339;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19953F86C;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795531366; bh=HSwH1G2ztI4XVuIpxGm5jCaIGdOBrcPPn6I/LiR0ErE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDdLoFoNOCRh4wx8Dt+N0YAX48rS5yofCSHP4YgowGgAqupRoB1XUFyiOgWSAXjsv
	 R9Ll5zo15TJAAAsFh8bp2IPsU6g5wRm60IFIFHPh/w9efiojqahBFW30REqhMEKzVw
	 xry7Tl9F7uRVevJe2tDZJ9cBuK4Joj+DAPL5HUjM=
Message-ID: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
Date: Tue, 24 Nov 2026 15:42:42 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
 <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
>> Can you please add the A7A and name as well? I will send the .dts
>> patch shortly, but having the name ready would reduce the churn and
>> avoid conflicts.
> 
> I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings

Many thanks! I just see that I messed up my sentence above, as I wanted 
to have the Cubie A7Z added as well, to reduce the churn and stupid 
conflicts between series.
If you respin, can you please add this one as well?

> are in Radxa's Linux 5.15 Cubie A7A board DTS.

Please note that copying from a BSP is typically not a good idea (though 
fine in this case). The devicetree as (somewhat) published by Allwinner 
is quite non-standard, to put it nicely. There are large conceptual 
differences even, so it's not just about naming or such. You can use 
their DT to figure out how peripherals are connected, or to learn about 
some IP in general, but it's not a good template to copy from for 
mainlining.
I would always look at other DTs in the mainline repo for reference.

> Please let me know if
> your DTS uses a different compatible.

Why would it do this? It's the very same SoC ;-)
But yes, "radxa,cubie-a7a", "allwinner,sun60i-a733" is the right string 
list. And just replace a7a with a7z for the other board, if you add this.

Thanks,
Andre.

P.S. I would like to post my A7A DT patch, with the hope that you could 
include that in your next post, shall you update your series again? So 
could you wait with a potential v6 post until I got that one tested and 
posted? Then you could ideally also include Vinicius' A7Z patch, so that 
we have all in one series, and just need to deal with the dependencies once.

> https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
> 
> Enzo

