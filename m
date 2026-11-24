Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533321;
	b=vAh5JDgeoS5szSmUgfetgNubYMViYJ9BryaDTffkyq8sdq0J//XPvWrD8cL7jRPsZ7bB
	 VY0nRcHW6qy7YeeAm4jejobAhMGZeac80RdPpV8oJiezpvVdUe4xE/qnzjhWnB696bzKE
	 mEa3bq9f3XpKVK6hABjh8tXQHBOzyffhHxkKjg+evvJxwmVvwoFj1bTNnVKhMFR5YYtsH
	 N44GPfHljZ9f5ykFY5AV7wdurMqZ0y5MIzeS/57o7Nf+zi8CQsezlb0harH415xBl3hbT
	 lH7Ygbyi7zoRJMjzcOVxCQehzuwhAXgq7FydkOgs5CchCrLuEtxRSpxKliD8NCF6WEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533321;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VCa1si+Rdw90HsiIEyC/2QXZHat4jvLNJ5wZvJeqrHo=;
	b=k2awDtWZKX+kCs2auy9EqHeHauD3uDlbU62jgyRbdl1gsGqLrCvoXYcoIPIVKOBmBm84
	 h7zNftzPOzBjgWNIbVo+DtstlrhNg9mQZuDzvsDvoKvB17vM1fK0v+0bshyBsKaz6QcmI
	 JrUNS3qYT/A6GguIFXWArg1JwqmXJBNkWXTzNNbXwH0iiQA6CZTWMRwLG+Klc2hJg1vEV
	 rukXSz5uT99OZVheAWRhr4th0ML/74+3PCJk34ZeTFtPjpHYxdljSK0unmIqFwq17h7Rc
	 GN9xGNjGw77dJidn7sVPCdWpxNAX+FZiMiNYbaIdESVIhedohIkpQdXy5FwSHbPsSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L5sOuLv2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E683D606A327
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 15:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E683D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L5sOuLv2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47DE1497;
	Tue, 24 Nov 2026 07:15:17 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8D83F763;
	Tue, 24 Nov 2026 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795533320; bh=6z7AZlLUL2DO+OdyjCHQWwyHNa89NmXSmwHe52ByhhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5sOuLv2W/AW84dHcy5h3x3Ld1v3cAaNC+yDmhHBSsvfdR/A4pNfghRoNO4gddfAQ
	 r7DCS9BJ+Ym+pCXK6NqN0JIYBn0cPajbC5S1D39TZs6I3YyU8KNs9qngX5RwyW8IQc
	 fwE6g94hEfLQ88hBzFYMYu6TNkfYhwfKLwX2GQ0Y=
Message-ID: <2ce0d340-c26f-4382-a341-bbcfb5575a8c@arm.com>
Date: Tue, 24 Nov 2026 16:15:15 +0100
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
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com>
 <20261121112312.75ba7299@ryzen.lan> <20261121-a733-dt-v4-2-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-dt-v4-2-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
>> So what's the purpose of this cpu-map really if it's all flat?
>> I wonder what the term "cluster" should really mean, here? I mean there
>> are surely different types of cores connected, with separate frequency
>> and power domains. So the cpu-map should not be flat, but describe that.
>> Yes, they all use the same MPIDR affinity level, and the manual talks
>> of "cluster0" only, but I wonder if this is not what this node here is
>> about.
>> Looks like the RK3588 also uses the same affinity level for all cores,
>> but has a differentiated cpu-map.
> 
> The map records the topology in the A733 User Manual v1.00,
> section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
> DynamIQ unit and share L3.

I would be careful with what's shown in those diagrams, they often 
simplify things, and Allwinner's documentation doesn't have the best 
reputation when it comes to fidelity ;-)

> The BSP's separate PLLs, CPU frequency
> policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
> two DVFS groups. Mainline can describe those with the clocks,
> separate opp-shared tables and CPU supplies.

Yes, they are separate now, whereas older SoCs would only allow one 
voltage and one frequency, across all cores. But those were v8.0 cores, 
without an DSU.
 From what I gathered, it is an explicit feature of those DynamIQ DSUs 
to combine multiple microarchitectures in one "cluster", and allow 
separate frequency and power domains. The shared L3 cache seems to be 
the defining feature of a "cluster" now.

> RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
> MT8192 and MT8186 to one cluster each. The MT8195 patch says the
> big and little CPUs are "in one cluster: fix the CPU map to reflect
> that." The other two patches make the same point for their SoCs.

Ah, so there are indeed conflicting examples. Apparently this cpu-map 
and the topology described there doesn't mean too much anymore, in 
practical terms.

> 
> https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
> https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
> https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com
> 
> I kept one cluster in v5. Do you still prefer a 6+2 split?

No, with this information just one cluster, in a "flat" map, is fine.

Thanks,
Andre

