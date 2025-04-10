Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBB28540C
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288627; cv=none; b=foDvatsEYuZPGSxQ/NQycVCpUQv9HSBkdCkeuJMyp6wN4r7sPlXJWGMeMaiNJKWgduSAX1iI24WWihs8nvRxSlRUqK2VD1yQIktiv+DKoxMKbTgv0T7Q9E8EMyOPzogcBHJgQEbPxvzn+0Y0G3qLlrEkqYBtDk3cqjtr6NzGEEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288627; c=relaxed/simple;
	bh=ABz4cDqiNS3kQXrpTOAbpSPw5QYVtGShy0gfjNUg76g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUexvdIoG+Ijl4ker+YmRPkZtu13vlNanFiuTlAj1jam9K64diNPxD850EQWCTBEjY3PJ6nw1aHwKJri2km8o/kHOSPBHosJD3HquQCgR0EkzhAfMDRodl0OpC17dcLefS+eaX9JkXt1uHf0DJF9POZucnCNgpelp3gFIJc3HcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbrzCnaZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbrzCnaZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0782d787so5361155e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288623; x=1744893423; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=tbrzCnaZjHoA/gYJaxMuRWfgDPa+1OaKZnixB/fyiXQaWoEl2rY+0HRynA+Ghwp+tX
         CykRf1JiuM3HBu068VDK+FpsqI/4AdUebJWRzzTWtHATJ1FOqTG2mh7HOex101fdqPKF
         MKnCwSGBwrwL4KeXbU9kgrfyg9N/POUL1YsP9ohf5BzANPwWmGtJtZZMHrZwkH1TzmWo
         e9qYBun1+gmUWNYmwMUzqI9ZlHjbJZF1cyltrKWtRkB4aw2cGDmdTu6abxiExxfBTMoP
         7O3Yl7oo5uEEvEa2UUmDTFS3JqF5fuEF61snH336UEazu4BVEirezIO43JHLo9kAGlEW
         Frnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288623; x=1744893423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=H98DsXMrui/vCM5AhxQCoGWNj5VCJr8dGsqyXbuUuFhukWVnJQ05P9amgxWRJakKrv
         8nYSzepI86EmxI5fKRUFLBLuIy/cunpn6zVf8/Cada6X46hGbq2qjwnx8q95LiwOi34Q
         Ax9UvclTaVLgtVr6OZDvSyMEhA+3M2TvhqAvvnMRswwafUdchbL0JgocPaTCRXABnrAk
         Ee/9Rs2ChRNd4YF+hnp3KeLgqhOSSgCLPbgvE7tHsiounjAVM+YMLMztRxSAFgwnnQFg
         LhzUSZb6pQA5PS19uLVLQAvcm+p+1KVi+M82PTp2cOkG4/2WtCmVRrcFC28GqZT1hYIw
         iKnw==
X-Forwarded-Encrypted: i=1; AJvYcCU+nWwO3/+u6xRIudedggysyqWnjCS5AquM3Ojlcq4W804tUDCxu9hDlf3vC3pT1YLnfeMFn7Y8omexwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHLJEQIWQvPmpMzEWt8ptJpAK6nHsoqhxuNYB7k7L5MvtmSdQs
	gA4oAONVXxPoDyyiwB8a7PQKZdwFiNjk82wNjzjKDzOhHS3qZTVsMzqcndAgDbo=
X-Gm-Gg: ASbGncv0GtpY/ZIte1ctLivkVtxdFzKjC8dwMqBtCbB1PfYSEfWTL/T1ShaQbv2CpuJ
	P80C2BGlUPcnPEyhrBtIi67W+DCY2cn9hY/i0+Q9ce5Y79LV3FhdY9uP+L3nd51EPiP3soT2WHL
	srgwgTX4oIE6ne7E21kG/oJVlAIJiBSbUYxPI4M/87kQrjNFz/+GWf1+am36PRBHW1wfW9EjSjQ
	qUDUyh8Q/QZ+s7fZJeDZLH8QlUEvPpcuYayDXIdBAtYqaRaUmYyndNI29FEv3z23FWwxd2AwyWu
	mDUiwJdNCwvJAJWGa6c8WJhhzceNHNJQ4uhxpVm170Flw8qrQOn1ohIAhVGqqX6DxnCZTNpTBtX
	98UgMJzjv0aa+cg==
X-Google-Smtp-Source: AGHT+IGMoIZKu18tKxGlE0nCM035PBeR69RdqmMHuq8h1Eu58CnOlQWvz4UQddkUAElDY1GsfzU8ew==
X-Received: by 2002:a05:600c:348a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f2fdceccfmr22721935e9.6.1744288622955;
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm53015095e9.37.2025.04.10.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Message-ID: <20de7ce7-1cfc-40bb-9457-84e462cf4483@linaro.org>
Date: Thu, 10 Apr 2025 14:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> The L3 cache is not part of cpu@0/l2-cache as it is shared among all
> cores. Move it to /cpus node which is the typical place for shared
> caches.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

