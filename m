Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389E12264B0
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644850; cv=pass; b=dkZqZGxD5Obj41ZHOF1BtT93dBsHbV6d+1M8mfE4+IBQxUNR6zOPGWVVQdq4T693OPkHGsIdTF3aFSBivy9tmfrSLpL4GWt6C0H6TQUvzIkMup0TANMlOUl4usIc/qmyw7Acm/Y74kEw3GbYNYoWbOOZssGSll4GSUxtMHJVtuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644850; c=relaxed/simple;
	bh=JhXUbAmc4eEDPKk8ugB/b+4DY0/aYbzevBnTQP/qoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgIVisqCAvyROpJnoTqSPeeL1/KYlzAicbo2Y+LCzQNaJ5Fm1U8YFgEuK4Bstsd8dg9MwyfdKepMW+qKyWEvhX93U4vpTkT+qWbOK2WKl8vvRa1Q0t2M8RqkdU94qOW4fdtHgLblp2fB5hbUJdNOMrQQLKoeQdy2aoZSjAYtilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW245yiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq/NrS85; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW245yiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq/NrS85"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2l0sD1220166
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 08:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqs1nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 08:00:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee5bab340so6088898a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 01:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644846; cv=none;
        d=google.com; s=arc-20260327;
        b=n+Dh3xCHKWS1nClHmY5b/wUiil5trTDbWYVMFiWPL5CiGYfoB/pbB9dxykkXPOnaCZ
         4I86gLESXoO9eCvwY2ELoBFzYwRGUl8fQZiW9/tIbC1fXR3w4iWLF8v4oAsU7mqo2N6F
         8/M6UX7yXBe6RFb1KFBc2T4u0eNzbZYOYdvoUHHbqF9jsDNjozUwbqe9jMwaSJP4UDzH
         0jnpF9CAoFClyrF4yJkOMnjvFkx+pWZSJlkcXM076iNIV9KbJ3n/zyMoSaJlGPwkonfZ
         0EVgCnqdlnTcOYVdS69gbTXZyO1LS1/LMgsdhHy1Uhx3GIRfyr+QL3BC/QeKvVwPUFkQ
         odUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=bDUo6AVhGkzRKugaiTYI0wkLVAKhhc0lyG0Ne7uijl0=;
        b=S11TpUnIpJrFcFu8CCvF/4ni8Zqz6w110NlVW+kwrXhbjv9lKGEq7XITP+m+wJArCL
         56y1Gfyqh0hj6/6SMfnBZVhQxYGzKwcpNRkEwcMnjLN0F6Q5QFjJc8FMVRvKBVt2WaSR
         tya5BSDkmAYUc0eMcYvWKX8Fc8642iX7g78vHaHfnMO9Jdq+pZgDVqCXNO1gyxQU36Ju
         xei9cG0X0sAfDClCQ/pOvGOWAX5oAa+Ziz7zHqvPwaNI9V8AhcGRT/fSw0nsWGGSdbXg
         mhFmJ3YgvVz8UVcPOJ52Apgfv0A6FICE0mpOLIZvVVazfzgI3u8AxLYLJis0H5eaUWrn
         zW/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644846; x=1788249646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=eq/NrS85YmIs8NY6pO/u/QcAVIbM5Nyl2zetz3SFjjk4cKYoPnTZ14M5Q2pQhe59os
         tYLET7Mx5b3UlRvSln8AtLHAV2LinCMQRGyrdbhAnbcDVGwZyEw4Ss3wMjdWRCeOxlbf
         a1GiG1jNASGqQzVEmF5UtRNHAgqUX+OJ5xC3UUh2V90Gzp2CgbaloJrf0WbyC5Tb5FWW
         tzcFVwEMxy16I6lsbenro2Tg+rIscCQTvJ8oCx+4sPDyeJNKay3F/F5yE7x2T74vxhIl
         nPBhyMUi9lgt+6BOh9a+1IMfYqZ7ewUMbiQBWffh9fH2DxMWPldwmfouj9ImV5JMfWMn
         0DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644846; x=1788249646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=Ezzax9W2yXzSMqqxs+iZverJqR/qrvk+nbu07AMb9J+MCKtb9iXWG0XbQjnkwvbv+X
         X9VFevIvWfrXEYIMzaXqybh2f7QnKvh4Q20eEB0e2fjBJJt8QIzpqpbsQHSHVQh3Lq6Y
         5Wg3/NacXA4kMyhHaFSxoIZRM41NfduK2YLVfCmxZJ2fEQJtaSlxAAu1XfC4JwizsCbL
         HFo1k8KuJ5iHNwc+x+bh+7uCv9RfmO4RyKEwjWGCpO87oz/EQTVZ8VCnFCACjH/4e5x5
         H5O+EmX144mnySRImfFjixV48CFoAANH5hZYMtUuqRPtA3u5oPggB0ayVEfCbHzHr2Wx
         ezVg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7FOd37lVw6t5NfQz/M5QhcF/LzACu2n1I6r2JUqI1x4I4AazKJxFRoe3DnYCRtAPhtF+1yojbj7Yumg==@lists.linux.dev
X-Gm-Message-State: AFuF++n480VEPNp7yF2DN8s/hNSiyxv4GHXZzBNXUmZl5I4d3QXV8Kgr
	H1Lf1UgcNE3WBgxQIr5H0XFEKFjNKr/hfFEKVnijf6rDOheT694gREZPfXlnvq+iLZZQQrS/kBs
	2f0cmbovRo1BlLG7aCgNjGIaYiV+8srniLb/4xKIqJQZC3puCuW9AkCnNm2yO/J+bcvh3yvQi3J
	rqj9pPFlDKv50Mh6+uPVDlLagbgv/1O69LXKcd7dhz
X-Gm-Gg: AR+sD10dleiK0O+VVDyCWULdG8CJDFID3P0FxU3OARjnHhnY7ZbAJ0T3mEn6deQ5q28
	AJig1+p4Mvlg+dFbHrUpnmDeTNRXpoauMpMYmjp4jAE//iHRaFsamWbico5jW3FGfnyM38deZgJ
	1WnYra5wnE4NbdXRC2WFDnLogzV7boOabZHjZ9nbwwhVrJUGCXhfF7k84rdA==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366619a91.4.1787644845887;
        Tue, 25 Aug 2026 01:00:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 17t_xTOQQPmatRhLMh33BvlsbhNKSrry
X-Proofpoint-ORIG-GUID: 17t_xTOQQPmatRhLMh33BvlsbhNKSrry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX3/5eEFpUwL2i
 yMlMhEGXkoeVS2OIVCGcLrVW1PSdHPjKdTea96L/hT81GWcXP/YwSaXbC269DP/EGVBU+MLCv2K
 F/kKax6zEuomG2XY5ycRTghDrMv/3X+iAzBCpXvM4Uq+E76N1AFumZ44kZOGbZjhH+V+29G/mT8
 1DUM2q8sliNhuU3sIYe6JXUL3nVKDkP3XIv46TnnrLe9deCuFwwr9ABUHuIipuHl10uxYPoigp4
 /8K5GF1UHKShEvnwrbfLxxjSczjsvjx8XDrjtmF2FlD/9OPZom2dyKD89nIFZT2TQio8Z81yYk/
 H1ccPzukdH/SNmpXhB+DzB7ePwGWt2WfEFjvbZtNXKkLMh3HMAFwaxfZkoVH9LfVEtX7YfdY0Nf
 7mt+UmVUZgG90D1mKpqD1M7SYj5aaqlb0HQYn71GYH3XVSbZp8jDyfljsE6axVr0SScOKVcDoNQ
 xiaPNW1CKOQBdUAYGbg==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX5+jk44pwa5Cx
 AlS2YVjU8c6Nhn3sdkP+AFkvqLBZsPyn6zIhSl3GCv2OySDDJOvKDpH1IYR5eyrUB0J9qAU1aeY
 dUn6T8dXwXIapC6S5BIwD0j+NQV2kEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250067

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>
