Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804616;
	b=YBaXwpv1nONC8ejwUEccWvWIaDjdj5o7YcCYP15jmqUXSh8rfJ7RA0tOYVSPFPaImJWq
	 CsiUMulaLLluk0riLh80FWkFn2tZqpXfS+IKQMaP/f3Pps19rCaQpKBhVdzjMt2Jx94p5
	 mryukwEywQaThPQRA29BQRJaPG5eQ0nxM2gZwWpanL4N6qvzTFX86Awev8bubOfroctGX
	 QBdtmKWzlNRdmqiwmXhKrP+SXmttkhZL4uTH4y9WRtxyW/MGYlCrXo5UsFsDNkHDoiO7f
	 c/85/8HQTNcmZXYf7WRZzkjLUd8FNTzSWp+ZuIaXoz6nTDY+we6oYjb00Jz9MWT7LpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804616;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G8NnEquHh6JPrt5WKM/35q0o6NTyLXSxP+cYgYnFdys=;
	b=cRFIhj9XE1rPRh0OHIP+syhzbUoqmLK4mVe/VMJW2XtRTyIR0LF16mnqWFNdLcg2IY5l
	 tWa8EF5YvYckZ2a20qzT/hTQPVXl01HKDaqkoQ+TzPZRHUN9BdjwJL7B6hs574ZYxoESk
	 RcRN44VQWWpuDfXShkyABKglgCaBurACqD90+j/1b4Kpk1nGtTFMhXU12aC3olXgp9TRM
	 ZyEV6iwn+4UXq88hGFm/FlLbc8bhnl9EU9x9MThmdVbL8gCcJOJWLtoxX+N2kgcDXIcGg
	 wcT85Mga5wobJpf5sKvKf+uHMqbStYY9ddBrgV+cUHnefK1dDNJBc1nbopGyjPapjmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b43+c8Cg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B300606A32A
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B300606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b43+c8Cg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EAC1575;
	Fri, 27 Nov 2026 10:36:52 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D623F86C;
	Fri, 27 Nov 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795804615; bh=6ifu5kHm5pa1d98fpL6HG21zQD2uf+dZa/ElH6oL+Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b43+c8Cg4WzasHC2UHK7/jdi18rQBwVZBc/LIiJEKn5ZFBSfL2YVSHmum9dYopHpX
	 8OWP0Rbke/ucNh6SaIdyrIob3sYstfEZM9D3p0mCkQ6rySMpwS42Nm/47wYzESNUpd
	 ZwDmP+375fMIpueHrm7xRx9WdUlVnu4x5+fy59Hs=
Message-ID: <5cde8317-61c0-4405-915f-44fcc3c54389@arm.com>
Date: Fri, 27 Nov 2026 18:36:49 +0000
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
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
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
 <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
 <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Enzo,

thanks for taking care and making the changes!

On 11/27/26 19:07, Enzo Adriano wrote:
>> Ah, indeed, good catch.
> 
> Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
> patch.

Yes, thanks.

> On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
> the A7S and A7Z? The schema still accepts the old name (deprecated), and
> CHECK_DTBS is clean.

Yes, it would be great if you could change that, too.

> Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
> on 2/5 [1] and your reply [2].

With no vqmmc, and vmmc pointing to a 3.3V regulator, I think it doesn't 
matter, no one would negotiate 1.8V anyway. And we didn't use that 
property before. I am not even sure it is correct for the A733, since 
the host controller DOES support 1.8V, it's just not "wired up" yet.
So unless someone screams, please leave it out (and feel free to do the 
same on the A7S). Eventually we will need to drop that property anyway.

Cheers,
Andre

> 
> [1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
> [2]
> https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com
> 
> Enzo

