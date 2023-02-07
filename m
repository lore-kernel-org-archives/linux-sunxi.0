Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D1F53A5
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Feb 2023 15:55:27 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 74so18837970ybl.12
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Feb 2023 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rL9+dw3zca2vRa5BnL9/kqAnrhDGkJiMDC4bgpZtRBI=;
        b=eR7lkzgRmR4r1+6i8yieIqB9MT6kbMNefuZvTG5JwjEcebSdedbhsWKK+z66fGmO8Y
         F9aW2NXseMlv8UtBD5OZBYt6QXwNZ5nTS97NXK7sbGGvEaT1bRNhnokvPQlEy9bmUCMH
         QQT+bUhb+skrQMnBQbdgajpR9mLqhrt6KTt3hFLYlGxuhaeUlo/sB2YqMR9UCS6JtKZV
         n2MtdPJ1K4ICCiJ7ZJamI499+hWpE9WP7g1yvOTFsmKRLXklTeUqt9FrW9rYqGXYBSmD
         cPc+rbgJ42idmqGg1nbNyVWizOpDOYU4xLKtOcIJOjcEVvw+XLoY/nahnB1UNlYkcNlR
         GDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rL9+dw3zca2vRa5BnL9/kqAnrhDGkJiMDC4bgpZtRBI=;
        b=AxVcJSWEPyxjRuGmzMf3JTEBXJQdJHQwEIUdNetD+zrA9h0PTZ7ZApK6BQe3TWaJTt
         n5jW+stcSbhQgVworzrTkVN01ZwZw0I6uYSEnjoUKeupfTetd6BwlTi3m3krESxrdAX3
         UCLSrxLSBdcwtc80re+8d2mBe7l8DhP2Z1ZrbRmNq33mFLhkhy1vfQMvNrDI7GscIpjG
         ozVhP644eMZVIpTyJ/v8bJn5jvt6G9m7CA4Oa5cpY3e/ZC3yIaIOlb+7QkOKeO8NazCj
         1o6ExLZGWXOaNJmBAK51qs+YPqtUQhPYOxjdHXlGftYkAOuARlLPcDQdCWuGG7WeifiX
         R8UQ==
X-Gm-Message-State: AO0yUKWt7YnEZvi/f69Q+nYeJsc2tpl/1fRPub0Vw64m85IHDh6lyBOC
	boKsrwpS5LOo1SCfcewCo3vKIOSjUAJgpNTulYY=
X-Google-Smtp-Source: AK7set/p/hlMAovW90UACxhdeikjcnSc2lcvlf/yOEUWA+GoYmYjo9ZSVypFtCZKo2QeyZFlVBC0W4ipVk6ppOESg8o=
X-Received: by 2002:a5b:d1:0:b0:88e:f2b1:3f1f with SMTP id d17-20020a5b00d1000000b0088ef2b13f1fmr401319ybp.11.1675785326408;
 Tue, 07 Feb 2023 07:55:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6919:601:b0:12b:dee5:71f0 with HTTP; Tue, 7 Feb 2023
 07:55:25 -0800 (PST)
In-Reply-To: <20230207090648.ncmptkr7g36j5fkt@houat>
References: <CAHdV42VzJNQUUD5NtkSnGcivXAmrHH-cQGXiA-A5g-fQFNbzuw@mail.gmail.com>
 <20230207090648.ncmptkr7g36j5fkt@houat>
From: Oleg Verych <olecom@gmail.com>
Date: Tue, 7 Feb 2023 18:55:25 +0300
Message-ID: <CAHdV42WdK8WhovXXWV4q6XCaJfb6+dc2peY81DMq5kL-Dn4S5w@mail.gmail.com>
Subject: Re: sun4i CCU CCF vs CSI0 question (Re: [PATCH] doc sunxi: update CCU
 wiki page link in clocks.rst)
To: Maxime Ripard <maxime@cerno.tech>
Cc: "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, Priit Laes <plaes@plaes.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Hello!

On 2/7/23, Maxime Ripard <maxime@cerno.tech> wrote:
> On Sun, Feb 05, 2023 at 09:50:22PM +0200, Oleg Verych wrote:
>> Hello!
>>
>> On 1/17/23, Oleg Verych <olecom@gmail.com> wrote:
>> > Update wiki page link to the Allwinner sunXi SoC Clock Control Module.
>> >
>> > Signed-off-by: Oleg Verych <olecom@gmail.com>
>> > ---
>> > Hi!
>> >
>> > Can I ask additional question to those in the file?
>>
>> Q:
>> > How is it possible to setup PLL7 to particular frequency and select
>> > it as a source to CSI0 via CCM_CSI0_CLK[1]?
>>
>> A:
>> by setting clock source and frequency via CCF[2] in a camera device as:
>>
>> ```
>> 	ov5640: camera@3c {
>> 		compatible = "ovti,ov5640";
>> 		reg = <0x3c>;
>> 		pinctrl-names = "default";
>> 		pinctrl-0 = <&csi0_clk_pin>;
>> 		clocks = <&ccu CLK_CSI0>;
>> 		clock-names = "xclk";
>>
>> 		assigned-clocks = <&ccu CLK_CSI0>, <&ccu 17>; /* 17 = CLK_PLL_VIDEO1 *
>> /
>
> You don't need the second clock.
>> 		assigned-clock-rates = <32000000>;
>> 		assigned-clock-parents = <&ccu 17>;
>> ...
>> 		port {
>> 			ov5640_to_csi0: endpoint {
>> ...
>>
>> ```
>> [2]
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml
>
> I'm not sure why you're trying to do that in the first place, but please
> note that this isn't a guarantee in any way. It could change at any
> point in time after probe has been called.

I see, thanks.

>> Set of other related questions:
>>
>> Q: When trying to setup main CSI0 clock to 32MHz from example above,
>> it is not possible to get integer mode value:
>>
>> sun4i_csi_probe mclk: 31578948 Hz
>>
>> Why it is so, while PLL7 can be configured to (3*(9 + 23)) = 96 MHz
>> which then can be divided by (2 + 1) using CCM_CSI0_CLK [1] /
>> CSI0_CLK_REG [A20_User_Manual_v1.4_20150510.pdf p.84]?
>
> I think what happens with your DT bits is that CLK_CSI0 and PLL_VIDEO1
> will be set to 32MHz, in that order.
>

Reading all clk-related replies along with the calculations they led
me to this solution, which works:
```
[  340.017355] ?dvp-csi-dev ?sun4i_csi_probe mclk: 32000000 Hz
		assigned-clocks = <&ccu CLK_CSI0>, <&ccu 17>;
		assigned-clock-parents = <&ccu 17>;
		assigned-clock-rates = <32000000>, <96000000>;
```

Thanks, very appreciated!
__________
