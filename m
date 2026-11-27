Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797035;
	b=pzJvumJIu82OOABLOCFOCrrVUQfd6+DmTmgAmiqLHHxkFJBOkkM90kNiBpyTACSg8hVB
	 mteoarXjKzVF5DLklcSZ0XcxuNnO+TJFSolcxBzSLJ/vNt1ytiPG4ALvdOnyQgVMlaa1V
	 6RaOE+B3tavUB3isVha45CYQDL9av6AChAKrgjxSV820D0molj3QdEksIIpjGV4fs9A+F
	 O6r4WaMHJ3shxN2tDirsHMX3KybfXx4B+OEfOzpXlgt+zn263MkAhZo3QiRxsdgXlyhvt
	 ib7nTnhmlTIDO69MdMDvneZKMrsWBcdcUPHVzpiUyLMzSCfIAkhnrGNEqzhZq1NjCMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797035;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=54NOpbOtuKLqL2nKVOoPWau8pDlerFu1Y4blbqD/sNI=;
	b=Yw/xB9nctMfKKqku2ELD740IHiNNjlvLYdLdyfiE8MmcgtNg/E3epRhJGfyQDfPgk8we
	 EA/WKYjC0U9KPO5c1TyNqC6s8it24HywAFEz05gfPnY0kPd6FCJqmCOsYlGYO77z10UpU
	 SP4P9e4zj0jCenwLoAY+lNsRudV1nWBrEnopIO7l43LblWrcwW7E4iMF94vR8nlUENtL1
	 6wE27g5wndWPiuj4J2xLxxs2WkAfaTd/VTKGs8fg7cdC3TDmQnxFsteoIbiXj2WiWiKRU
	 lsqw+3tHEHibf3sVqC2iy+lMT6aLNr1M9NCWVZfVXim9F7cln/pr+/2nm2i0cfudCcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AMyJGtPh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D60606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 16:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AMyJGtPh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627D71570;
	Fri, 27 Nov 2026 08:30:31 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE823F86F;
	Fri, 27 Nov 2026 08:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795797034; bh=b33/9jIn33AHiLVOktQcqCtJ8czOf9Xr7CxwoHhocU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AMyJGtPhp4st87WhHQjG9x2Xm7CAavKQX7s8SJQATPgdBrrVhcClJ0J2GhoBiahLO
	 YvNt3wdAsddMsQHGJy9k1qlZDj30gapE55u/Ux9lTxZIdoAVJDljuAI3+ZIP8fg7o4
	 7ubxHpqKGnQP7cEVxWdQ48ojV+YXZX7+soqu8Li8=
Message-ID: <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
Date: Fri, 27 Nov 2026 16:30:29 +0000
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
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
To: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
 <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
 <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Norman,

(please try to reply in-line, with the question quoted, to make it 
easier for other people to follow the thread)

On 11/27/26 17:17, Norman Herms wrote:
> Hi Andre,
> 
> On the ELDO1 question: the AXP318W datasheet (V1.0, Chinese, table
> 6-3) gives ELDO1 a default of 0.9 V and leaves it off at power-up, as it
> does DCDC6 and DCDC7. So 1.075 V is not the PMIC default.

Ah, thanks!
> On the A7S we boot our own chain (U-Boot SPL calling the vendor DRAM
> init, TF-A, U-Boot), and none of the open parts writes ELDO1. That
> leaves the vendor DRAM init, which switches it on. Its value follows
> VDD2H on the 25 mV grid: with DCDC7 at 1080 mV we read ELDO1 at
> 1075 mV, and with Radxa's own boot0 at 1120 mV we read 1100 mV.

That's good info, thanks!

> We have also tried VDD2L at 0.9 V on the A7S. Lowering ELDO1 from
> Linux changes the voltage after the DRAM training ran at 1.075 V,
> which can lead to errors.

Yeah, I was concerned about this as well. LPDDR5 DRAM init/training 
seems to be a lot more sensitive than <=LPDDR4 (it even requires 
occasional retraining at runtime?), so changing voltages after the fact 
sounds dangerous.

> So we keep the value the DRAM init leaves,
> even though it does not match the schematic, as the v6 node without
> voltage bounds does. The vendor DRAM init sets all the DRAM rails
> itself, so a clean 0.9 V would have to come from there.

OK, that's something we probably can do with the in-flight Open Source 
DRAM init driver then, which is (in parts at least) already on the list.

Regardless I wouldn't want to leave it completely unbound, but instead 
provide some limits. I guess for VDD2L, potentially the same as VDD2H, 
it should be 0.87V - 1.12V, which seem to be limits Google turns up for 
those LPDDR5 specified values.

I will adjust the DT for the A7A.

Cheers,
Andre

