Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80463B6
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 15:26:08 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DE93A3EF61;
	Fri, 11 Aug 2023 17:25:58 +0200 (CEST)
Date: Fri, 11 Aug 2023 17:25:53 +0200
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
To: Conor Dooley <conor@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Andre Przywara
	<andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>, Marijn Suijten
	<marijn.suijten@somainline.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>
Message-Id: <57G8ZR.76AWV7E8IMKK@somainline.org>
In-Reply-To: <20230811-slighted-myspace-2088c599a53b@spud>
References: <20230811-sid-h616-v1-0-d1dfc9f47b19@somainline.org>
	<20230811-sid-h616-v1-1-d1dfc9f47b19@somainline.org>
	<20230811-slighted-myspace-2088c599a53b@spud>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Fri, Aug 11 2023 at 04:23:11 PM +01:00:00, Conor Dooley 
<conor@kernel.org> wrote:
> On Fri, Aug 11, 2023 at 01:02:34PM +0200, Martin Botka wrote:
>>  Add binding for the SID controller found in H616 SoC
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>   
>> Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml 
>> | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>>  diff --git 
>> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml 
>> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
>>  index 296001e7f498..2ec0a1b8f803 100644
>>  --- 
>> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
>>  +++ 
>> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
>>  @@ -27,6 +27,7 @@ properties:
>>             - const: allwinner,sun50i-a64-sid
>>         - const: allwinner,sun50i-h5-sid
>>         - const: allwinner,sun50i-h6-sid
>>  +      - const: allwinner,sun50i-h616-sid
> 
> As said by Andre, use a fallback compatible here please.

Will do.
Cheers,
Martin


