Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CD182C8
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691077603;
	bh=vEUJQiTvEBG1+8Thcde8Im23KjWtFftPqnOmL2GHGV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=K2PuctE69nxr0rUot2PNv4ylshdtRVSeIl/yN9hKHhRo7YfKrrppI/h9ygf2x/HqO
	 1cAV+bd0j10nClp1xvNVKLJOqHBRsNrNRSJYoYo/phVTRa5HnaVPObZ/08P8XExgXs
	 irxaSAQHMhaY8rE6awq+vZ4SwUiSBQEky6rCtaO8=
X-QQ-mid: bizesmtp72t1691077560t8gsk891
Received: from [192.168.2.144] ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 23:45:48 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: +ynUkgUhZJlN12CIkCekGp9zU8fBqaUp7Mo7KoBT1wwh+SAS/eNdGKnz7i+WE
	m+5kBwl0ZVCwSs+KuNx/TCAJdo6mzgwucEwIFAkaa3sRNUKszz25vjSrwJJJ3AdzibnQXM9
	c+tSm3QOjkt2eXcJUmXw6RaKY2T15s3rYtmp6rqltVdNgHypdtwRpCBRzkF/hQRl1PmBFLO
	lUQSFI+aLUIdWUUKfB/pFt71QC1Q3kHumbf/Nu1yHnNBFuctyhndbjzhsmeN764fN8Y6AiP
	4hLIWea/DFZ07VCu1LX7vg+lFhBOmeL6SIgVwdsB6KH/ma1RWEF2JvTaDMuUsPuG1K3YjOf
	s95WRMGUhH9AOkEhAlngWrkrqE1NLZrL9eAqyudOMvHvF2NeGFqgRjcVrshMXZDpslShIbx
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 2364252577527369001
Message-ID: <15C903493507AF24+e69c7dde-58ae-f55d-3d1f-b41891caded7@biqu3d.com>
Date: Thu, 3 Aug 2023 17:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/6] dt-bindings: vendor-prefixes: Add BigTreeTech
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Icenowy Zheng <uwu@icenowy.me>, Ludwig Kormann <ludwig.kormann@ict42.de>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230802220309.163804-1-martin@biqu3d.com>
 <32C9B4A9A60647F1+20230802220309.163804-2-martin@biqu3d.com>
 <0bb37521-0ea8-b343-b801-d57ee17fde55@linaro.org>
From: Martin Botka <martin@biqu3d.com>
In-Reply-To: <0bb37521-0ea8-b343-b801-d57ee17fde55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1



On 8/3/23 4:27 PM, Krzysztof Kozlowski wrote:
> On 03/08/2023 00:02, Martin Botka wrote:
>> From: Martin Botka <martin.botka@somainline.org>
>>
>> BigTreeTech is a company based in Shenzhen that makes
>> 3D printers and accessories.
>>
>> Add prefix for it.
>>
>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index af60bf1a6664..1d5f86e3f099 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -194,6 +194,8 @@ patternProperties:
>>       description: Beckhoff Automation GmbH & Co. KG
>>     "^bitmain,.*":
>>       description: Bitmain Technologies
>> +  "^bigtreetech,.*":
> 
> Please keep alphabetical order.
Got it.

Cheers,
Martin
> 
> Best regards,
> Krzysztof
> 
> 
