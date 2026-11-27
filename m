Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780589;
	b=ZFNlvS6HCQ6Zt7TeRJdjvBg6zG0gME07VL0Tr42Rmnfhhezhgj97X44O5UiRxFbKZ6im
	 UBiPSXgFV43Gj3xlMFv/Zu6Z7LU4F+5BOyaaIJYelCoThCSG2CLS2eoE/FSo/oIYaO64Q
	 Qw3dS1W5kwGEznkRgfUOxIhQUDRFFUThOPR+cGyqkYJ9Jg24BHmATMbEA8ykew9QyS+iW
	 DnAV3iE22ie/b4XES/4pKKc//+sCyFdEUuygsSeucxwp+/nKrV2InNxR3MpKSvbrI50MK
	 HJA0cvLuhaa1gkKAzyMkU8ntuVH+5qlCRaGibYdZkwqT4wttrHmOdHw29NfujWAVlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780589;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A68Fc43o/OGN2y9oSPSSDZxzULRR2g11UStqF9f/CJs=;
	b=p0+mnsCnr/AugXXxUnpSnRz/b7+x2l1dwDm3cY4kQt0k5DX8hRROOYhKXmfSkVAaEn4L
	 hAl7wra/A9e33wtCUyp1HIOUrGNEOIsTJkJVE87RbHMxlSascuiaoIN11JNLadeS/b8wv
	 Dt1VKQVjv8stOCwE/vhhkpbKwbHWn4AwBDJA44bJzkeWfOI0cobaj8h5Mv/9DVHOCVUAs
	 lqxY/VMv6pJZrkwWKDzyaJxZgnQzTvFhQzb0FRscG6jWtbe3qk3hsapSyB0SzIWyOU4qB
	 OCOnm9n6ttVftWHvX8EZrNv2iAprHLuY6T5ZtAwTaQUjYnYFHDdItQk52qzq31Y/MdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=POp6Ljo8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70ED606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70ED606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=POp6Ljo8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFFF11756;
	Fri, 27 Nov 2026 03:56:24 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4B3E3F632;
	Fri, 27 Nov 2026 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795780587; bh=Xs58qPOPag1jyxHKAgsrv/b8NJwtq1sPSFPfFX2lDeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=POp6Ljo8RAhx+OMn/hFpNNbPk3PjT0+ggeTztYGji34/ryVbRZarbEUAynH4+1G5R
	 a3rST72HMFa6ZQoEjqX3b3RSyAJ9sglyMEukcjkb0cPfanDrQ6r+OfC1DSNKcVuM1q
	 LDh6iqHLnvTvqCha5r0wgUazDC8WjUxYsCCz3jrs=
Message-ID: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Date: Fri, 27 Nov 2026 11:56:22 +0000
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
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
To: Jerome Brunet <jbrunet@baylibre.com>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
 <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jerome,

On 11/27/26 12:33, Jerome Brunet wrote:
> On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:
> 
>> +
>> +&pio {
>> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pc-supply = <&reg_cldo5>;
>> +	vcc-pd-supply = <&reg_swout1>;
>> +	vcc-pe-supply = <&reg_bldo1>;
>> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pg-supply = <&reg_aldo1>;
>> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pj-supply = <&reg_swout1>;
>> +	vcc-pk-supply = <&reg_aldo1>;
> 
> K is bldo1 according to the schematics

Ah, indeed, good catch. The schematic is somewhat confusing in parts 
(VCC-PG for instance), but indeed the VCC-PK label is actually VCC-PK.

Thanks,
Andre.

> 
>> +};
>> +
>> +&r_i2c0 {
> 

