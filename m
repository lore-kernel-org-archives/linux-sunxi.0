Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28EB363
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Apr 2022 04:05:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6209D3200946;
	Tue, 26 Apr 2022 00:05:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 26 Apr 2022 00:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1650945917; x=
	1651032317; bh=kk7eWmSE5SMkshDwRFhMdI5C76SkJ5u1WBRC4dxAVTc=; b=W
	QkGYuJ3S7otdLGJT8Eg3kBOAXCjyReU6FdM+fHUgC8XJWof5snHI+OVRchRKrCGr
	skaK+G84NAuhYye+Th4ObXmxqlXx5jt+VqRSWOCN7HtagnbulFq+J+Dlz+uffHVv
	7/X6KfknjORa4KTj4IKZ3T/fSPdb1jg50KAochI09dWfF9aaTMoeaP3ta02X7ikm
	3UkxRjuX9O9ALcc0XiQ6blHxpjeqGqga5J0ZfHsV5gOWqAMNAHte4wF/f+KuDq/N
	z4fyx4IR2za7r7+TveUkAv69PwXnhT5lbBJMEvNTs3RKirMgjVlEItI3DAcw8LKl
	7rAp869tuNdfTrEPsw9/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1650945917; x=1651032317; bh=kk7eWmSE5SMks
	hDwRFhMdI5C76SkJ5u1WBRC4dxAVTc=; b=Nq0wqIA0WiF6GErD87V0bUM/kgY4M
	N5aXguMJF6sAaZ3lBRiDpKr73yPU5RrkpG0tfbDG6KRRbE+vqB4cNyCZF2Z7nKzq
	EI2xtPjHtsvAK1ky5UgYK87ycCpwy3gnCPNbFYBEHbktgee1m/VoXCY9aZQs04Rd
	SHMDXvihKH5MFe5pkzM8iI8soEgQNfXhgwv1ORbYgmnWg3Day5qJg54zRXpBURNi
	1l8IyS1PCRD0VZ2XzJ98bhnlClZf5CUvHctyfyknSD0/httYTzIY4D20aiwUVvMt
	5gqNEdrBdggzbJ3ThhLTagzr3bF+2L3fO0UMgRUA4cpE2kEt5Z9gFxWOg==
X-ME-Sender: <xms:fW9nYsLsHb0FFwgMMa5D58F0P5K8wjAYYXPxIYwOPGkjdWHYILVdnA>
    <xme:fW9nYsI2Qi9MboqBbjUQw5PWHwVxmJVW2_B7S7TmGJ-F9_maWq4H0cHdFnnFwWCyW
    6EJBH45Zei2YJ4JBg>
X-ME-Received: <xmr:fW9nYsv0m0rsU5OgYKTort4HsX4QYxLAVf97pvj7nFky6F1IyvP1gCybPmH1EJmlWSC8L-LTMVMCnH-lxP3kMBVTA89eQXbVYKbYx2olYXJ8LNq7-FSYkBg84g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnheptdevhfehhefgvdekteffleduueduheduuedvtdevleelkeevvdeu
    vdeihfekueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:fW9nYpYIXdwFVz9Y10FSfz0QAvqKIR8Y8m90BS2dxsgl_WFpcjXYqA>
    <xmx:fW9nYjYw36OVmpjZFdJzRGebzohn1Pi6MB2sekpjswrNM2Wrm56xRA>
    <xmx:fW9nYlCnBhItpHNahr3_89b0FsQRcL0bASo_v3KRbTJCU6s30duwLg>
    <xmx:fW9nYiU6KctnBKP8UB_fpvuD5pVqFeSvvAWl06b9VkHyuTzkVN2mUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 00:05:16 -0400 (EDT)
Subject: Re: [PATCH] arm64: dts: allwinner: teres-i: Add GPIO port regulators
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Harald Geyer <harald@ccbib.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Torsten Duwe <duwe@suse.de>
References: <20220415165605.28560-1-harald@ccbib.org>
 <336f8b96-6eee-16a5-e896-e90c4020f740@sholland.org>
 <462969fd722eec45aa5f142de48b7fbd@ccbib.org> <5259899.Sb9uPGUboI@kista>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <71e61e41-712f-3f5d-74d6-46b01d672e7b@sholland.org>
Date: Mon, 25 Apr 2022 23:05:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5259899.Sb9uPGUboI@kista>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 4/25/22 11:28 AM, Jernej Škrabec wrote:
> Hi Harald!
> 
> Dne ponedeljek, 25. april 2022 ob 13:01:54 CEST je Harald Geyer napisal(a):
>> On 24.04.2022 03:56, Samuel Holland wrote:
>>> On 4/15/22 11:56 AM, Harald Geyer wrote:
>>>> Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.
>>>>
>>>> Usually supplies are linked via the 'regulator-name' property of
>>>> regulator nodes. However when regulators are shared we need to
>>>> declare the additional links in the pinctrl node.
>>>>
>>>> Signed-off-by: Harald Geyer <harald@ccbib.org>
>>>
>>> I'm curious if this solved an issue for you, or if this is just for 
>>> accuracy.
>>> Both of these regulators have the regulator-always-on property, so
>>> they should have been enabled already.
>>
>> You are right, there shouldn't be any change in functionality. It is 
>> mostly
>> for extra correctness. However the pincontrol driver started spewing 
>> lot's
>> of warnings about missing regulator nodes a few versions back. The 
>> visible
>> effect of this change is to silence those warnings. Also make the DTS 
>> more
>> future proof in case the driver is made even more picky in the future.
>>
>>> If it's the latter reason, why not add the other
>>> ports? Regardless:
>>
>> PD, PE and PL have dedicated regulators, that can be matched via the
>> 'regulator-name' property. I didn't want to specify the same 
>> information
>> in two places.
> 
> "regulator-name" is only a label, while phandle is actual regulator reference 
> that can be used by the driver. While DT files reside in Linux kernel source, 
> they are used by other OSes and bootloaders, so you can't really assume what 
> is good or not just by judging based on Linux behaviour. So please add PD and 
> PL regulators too.

Yes, agreed, except for VCC-PL, which (as the comments in several devicetrees
note) will cause a circular dependency when loading drivers.

>> For the PF supply, I couldn't find any connection information in the
>> board schematic. I could have added a dummy regulator. But since there 
>> is
>> only one warning about pf-supply during driver initialization and not 
>> the
>> dozens of warnings I see about PC and PG, I figured, I'd rather not add
>> information of dubious use or qualiy.
> 
> You mean PE right? There is no PF supply on A64. Anyway, if it's not on 
> schematic, it can be assumed unconnected and thus you shouldn't define that 
> property. Messages like "using dummy regulator" are fine in such cases .

All of the ports without a separate VCC-Px input are powered by VCC-IO, which in
this case is supplied from DCDC1.

Regards,
Samuel

> There is no issue of "dubious quality" if schematic is clear. Also don't worry 
> about usefulness. DT files are hardware description files. They should reflect 
> hardware configuration, no matter how useful information seems.
> 
> FYI, information in this case is useful to the driver. If you check sunxi 
> pinctrl driver, you can see that port bias is set according to regulator 
> voltage.
> 
> Best regards,
> Jernej
> 
>>
>> best regards,
>> Harald
>>
>>
>>> Reviewed-by: Samuel Holland <samuel@sholland.org>
>>>
>>>> ---
>>>>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts 
>>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>>>> index aff0660b899c..cc316ef2e2d6 100644
>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
>>>> @@ -197,6 +197,11 @@ &ohci1 {
>>>>  	status = "okay";
>>>>  };
>>>>
>>>> +&pio {
>>>> +	vcc-pc-supply = <&reg_dcdc1>;
>>>> +	vcc-pg-supply = <&reg_aldo2>;
>>>> +};
>>>> +
>>>>  &pwm {
>>>>  	status = "okay";
>>>>  };
>>>>
>>
>>
> 
> 

