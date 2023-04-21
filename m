Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446F17EF
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 07:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950C6C433D2;
	Fri, 21 Apr 2023 07:07:17 +0000 (UTC)
Message-ID: <e9bb9952-c2ef-c7a6-a787-aa2597c3ed4e@xs4all.nl>
Date: Fri, 21 Apr 2023 09:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: display: synopsys,dw-hdmi: Add property
 for disabling CEC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, wens@csie.org, samuel@sholland.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-2-jernej.skrabec@gmail.com>
 <20230418214115.GA2376963-robh@kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230418214115.GA2376963-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2023 23:41, Rob Herring wrote:
> On Sat, Apr 15, 2023 at 12:46:11PM +0200, Jernej Skrabec wrote:
>> Even though some DW-HDMI controllers have perfectly usable HDMI-CEC
>> implementation, some boards might prefer not to use it or even use
>> software implementation instead.
>>
>> Add property for disabling CEC so driver doesn't expose unused CEC
>> interface, if CEC pin isn't connected anywhere.
> 
> Isn't this all true for any bridge supporting CEC? Make this common.

I agree with that, there was a similar case in the past:

https://lore.kernel.org/linux-media/20180323125915.13986-1-hverkuil@xs4all.nl/

I never followed up to that, but I believe this is generic for any HDMI transmitter
or receiver with built-in CEC support where the CEC line is not actually hooked
up to the HDMI pin.

There is no way for the CEC driver to detect that, so this has to be communicated
in the device tree.

For standalone CEC devices you can just disable them in the device tree, of course,
but if it is incorporated into the HDMI device itself, then it needs to be told.

Regards,

	Hans

> 
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> ---
>>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> index 4b7e54a8f037..624d32c024f6 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
>> @@ -48,6 +48,11 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  snps,disable-cec:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      Disable HDMI-CEC.
>> +
>>  additionalProperties: true
>>  
>>  ...
>> -- 
>> 2.40.0
>>

