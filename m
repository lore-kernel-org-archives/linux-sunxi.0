Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6ED2F21
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Feb 2023 19:50:24 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-52770ee8cf0so59300397b3.2
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Feb 2023 11:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OzW3S3s63Y6cIm/UyFETtsjyiQGHwUlp7fUBKecK0ck=;
        b=SIhFHKEnaz3mCVMVOOv93OuAmAajZtxGgXP6ysrN4OhorVs/zRpyBVu/VjoP9IzrIp
         E0pbXEZ9l8hKpdXPzeslsw7QKGDaB4uTtX6Lh24KNXpg7Cql1W8WiMh9dB/jc9eXC9mk
         wxfAiVSl4iNP69AqIy9ImaRb/NgdFXNT9DXdj4DChKb+SbB+C5WKoOYx4mO+mEXFv9H3
         6/1066IXyR8ncDwiaI/KZ4EX+yCjzvcTOPmhdF2hxVLI5a13ppiObvNa9oc1CJUgqVDv
         MfqlIBkNcx5k3YjSvmpf+gUzCcYWbwCFoJ7kKFtXZrEoja/flpeRyhwLeQwd2kth7HxF
         JTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzW3S3s63Y6cIm/UyFETtsjyiQGHwUlp7fUBKecK0ck=;
        b=cg14hPHwad+3Y2WLfSDac5Av2na9QNjIcMzSyXrsNdDOqghcuEWr2772Xlx/Z4XDlc
         RwDELGFC9oR0q8meJCsrazd0Kh4x7EBaEoqiWVBMx8l5zq+6VpbRxuMCoAyMH0DWB9jG
         NlQ57cyc2JwhIlzzlvOZnenPuVZhA9k6hyzMEF9TY1W03kBeSovFuU1jNdKumquja0xa
         JdW68tI1EEYRre7Yn7h8JR4Q5JVJ5BCaBhWVLH21onKy4o9MLMVqJyLTZ31RrdLR0cV6
         6IAfgmoJ6z34MwLEbK1XVrli+KcGVyrlqrSBxvOVv19Pg0oboXiMdtDWFz1CKyKOxt4b
         WJJA==
X-Gm-Message-State: AO0yUKW52OkfqDxBdMl4ZQpeiluz1fThSOBd9b5BtFXc4VGUQXgUpad6
	7bddLdFP3uEXf30nKWumRvFI7DC8b6o5WDwyLOAWLQO3
X-Google-Smtp-Source: AK7set9V75azHx2IRGm8qoCKxYNZyWcsRecKKnW6icwxydmDjnatxuyQ6IvP7Gc/0zRsTQlJI+/Ssq1OXNK9EUp2UFs=
X-Received: by 2002:a0d:ddc9:0:b0:526:696c:a230 with SMTP id
 g192-20020a0dddc9000000b00526696ca230mr1013444ywe.493.1675626623183; Sun, 05
 Feb 2023 11:50:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6919:2f06:b0:12b:8141:b92e with HTTP; Sun, 5 Feb 2023
 11:50:22 -0800 (PST)
From: Oleg Verych <olecom@gmail.com>
Date: Sun, 5 Feb 2023 21:50:22 +0200
Message-ID: <CAHdV42VzJNQUUD5NtkSnGcivXAmrHH-cQGXiA-A5g-fQFNbzuw@mail.gmail.com>
Subject: sun4i CCU CCF vs CSI0 question (Re: [PATCH] doc sunxi: update CCU
 wiki page link in clocks.rst)
To: "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Cc: Priit Laes <plaes@plaes.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>, 
	linux-sunxi <linux-sunxi@googlegroups.com>, Oleg Verych <olecom@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello!

On 1/17/23, Oleg Verych <olecom@gmail.com> wrote:
> Update wiki page link to the Allwinner sunXi SoC Clock Control Module.
>
> Signed-off-by: Oleg Verych <olecom@gmail.com>
> ---
> Hi!
>
> Can I ask additional question to those in the file?

Q:
> How is it possible to setup PLL7 to particular frequency and select
> it as a source to CSI0 via CCM_CSI0_CLK[1]?

A:
by setting clock source and frequency via CCF[2] in a camera device as:

```
	ov5640: camera@3c {
		compatible = "ovti,ov5640";
		reg = <0x3c>;
		pinctrl-names = "default";
		pinctrl-0 = <&csi0_clk_pin>;
		clocks = <&ccu CLK_CSI0>;
		clock-names = "xclk";

		assigned-clocks = <&ccu CLK_CSI0>, <&ccu 17>; /* 17 = CLK_PLL_VIDEO1 * /
		assigned-clock-rates = <32000000>;
		assigned-clock-parents = <&ccu 17>;
...
		port {
			ov5640_to_csi0: endpoint {
...

```
[2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml

Set of other related questions:

Q: When trying to setup main CSI0 clock to 32MHz from example above,
it is not possible to get integer mode value:

sun4i_csi_probe mclk: 31578948 Hz

Why it is so, while PLL7 can be configured to (3*(9 + 23)) = 96 MHz
which then can be divided by (2 + 1) using CCM_CSI0_CLK [1] /
CSI0_CLK_REG [A20_User_Manual_v1.4_20150510.pdf p.84]?

Q: Initial value for CSI0 ISP clock is not as hardcoded in
`sun4i_csi_runtime_resume()`. Is it correct to hardcode the value for
resume? E.g.[3]:
```
	clk_prepare_enable(csi->ram_clk);
>>	clk_set_rate(csi->isp_clk, 80000000);
	clk_prepare_enable(csi->isp_clk);
```
[3] https://elixir.bootlin.com/linux/v6.1/source/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c#L303


Q: Is there a good guide / how-to somewhere on how to suspend/resume
A20-processor based devices, e.g. for `sun4i_csi_runtime_resume()`
testing?

Thanks!

> Is it possible to put such device tree example in documentation?
>
> Thanks!

[1] https://linux-sunxi.org/Clock_Control_Module#CCM_CSI0_CLK

>  Documentation/arm/sunxi/clocks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arm/sunxi/clocks.rst
> b/Documentation/arm/sunxi/clocks.rst
> index 23bd03f3e..f435bdd70 100644
> --- a/Documentation/arm/sunxi/clocks.rst
> +++ b/Documentation/arm/sunxi/clocks.rst
> @@ -49,7 +49,7 @@ Q: Were can I learn more about the sunxi clocks?
>  A: The linux-sunxi wiki contains a page documenting the clock registers,
>     you can find it at
>
> -        http://linux-sunxi.org/A10/CCM
> +        https://linux-sunxi.org/Clock_Control_Module
>
>     The authoritative source for information at this time is the ccmu
> driver
>     released by Allwinner, you can find it at
> --
> 2.20.1
>
>
-- 
sed 'sh && sed && node.js + olecom = happiness and mirth'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
