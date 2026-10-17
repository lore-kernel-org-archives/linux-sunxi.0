Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56A93ACF15
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255171; cv=none; b=VfiBbV2bq1ng2kn1Y7HSoRu3CZ+oyX02+Qs69387ZZCZPCuYE0LtIn3mrOmEJIfxP782oD4h3ZBdrnYROiTLD0kPs9EMQSLYFKTXPe3J1JZVLjg/FMW/JGoaKzWLHfRsKMcw0TobH2PTCIpLuJwyeYss+imi3K7Z6K2bGGzQcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255171; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaPlv/662VrPQy/rUP68T3l6M2gm93zs6u6xn5o+FbxxCkVKmmX6/D53aEqn/ibQaXE6EGc4bumJKQG5gg5X4jU74dqOuVoFo79nhPQs6imxr1Hm3BcithiazDeNwnKGk15Is9b6mWjpNwUoHZZCihzzNHs5MvUe4ybRDyK+BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzG0EAFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzG0EAFZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAHgq2033071
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhbup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35d4538fd74so2935991eec.1
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255167; x=1792859967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=BzG0EAFZvHFsAd7ZTQx+rH60W/S3eB9zzG8ZuDAicF+GL8TwNeLOLMEUwgSQBMUnTg
         aWLAy+DeJ5Z3YikzXuXQOHw/Pzm2DA/JxO9IO4pyUKhhMaynKWjflyvOUPrfcSe+VF67
         I+4ZGvAFODik4G/AM6pm84UWoqi2dBaLb8fUN7ondRNshx4FTeeWTPhyCagZN6Zfr1XA
         VvI/W3ppKM1Sl51KvYJvxrnlJCkRRsyLe2e0H1VMjRaG0YcC2s2Yyu18wpTCM7wdjkpB
         6F54ovyBAh7q0aIqTGhThvNSLdNIg0o6/7btwUThPSfMDJtrsuVorpIHFPd1q5qG1bb6
         vb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255167; x=1792859967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=TAhIAUtGxZjbAIKSWuuwD+tdKBbNIrjaoB2bBsj3NTE1VEQCgUqXmqKX2rGUle1a3k
         wd5zH90/BLpdX1S7ladj/2ausXQoQFRMbTqZTVP8gq9HfX4aGK6hne5YEBzufz6BKiiV
         S0mMR5G6ss6tHtAYZwJ93Trf32AKI0hb3SlQxC/xm8jYqZn22/kJMcnsL+pU28D4nCvr
         WEWjEmwM4NtTlhFGg8PQgonFRte3fHYEMyg0mD2dJ6RVxSgW9LuZ/YXRwmRqHwRqBELy
         wgnCCu5IMOrMt84uN/LEzKkK7phvMjo3AbESHv6E9sXGP5ZOUcpdYaVoMkRsBed0vMZt
         AcUg==
X-Forwarded-Encrypted: i=1; AKwUvBxyMo4vDAMNaRhrQ+1Ip/yYQLV0lPNy98wqZ300gciuj7MTWRF63mH3pl3Rud3ok3Bz/UhH/Tae78UJGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKv95OFc0+lm2tOS+pxZ+cMbgukFxdvjSmQ6EFFI/a+3OTbShdS
	Qrz6JuT7vxd5I/WeeWxWUKQYDJjLznM7wKXUVyWchfwoCGWKxMNu50v+ssSDAkxArDihkRcyks3
	2AUr9pKrbAXNi9q+CYGze+vRypN3qqzsLXktkLTNQwdFwfILt5ayA6so+TqH6431vjA==
X-Gm-Gg: AYBFou21cb2ON8ILKlxK+w9qvQ0KxUnXTrWWFmx9OO94G9Ua62WyzeuLBkFR7HM5UHR
	lNykt4FlVPzDWeGC4epTOCW1nN/Y96nxpmKJluP1GJu9Gp4f66qtvwqN6x0MS5sEXL50zelNUqv
	8hsmjHMg0Ld0vegZG0qjdoYFF1UnYkmDgHnvgvKljUg1lg9qlVQrJKVG1pYWU45N0sVK4hzf85Z
	4xK930Eip2+tI1Mc6VNJW46Xyhha4WFCFEB8PH8ajWN2XprXDheDIaJCGgN9jkXmb7gzcnVyYMD
	ioYiYCaJVBrdMfruhR9QYAyn9pwjqi9/Qtbp9k39tNrZ775EPGmRHeLmPAIpuhNKuUW5nsfg/pB
	qniLUikmYKjqk
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629946eec.32.1792255167298;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXyKnePk514pdr
 S5T2o69obDwhlx5GOwI68QfnEWll2diIbflpl96+hBJ/xa3DSbyjhIU371+f/bhGp7XXfyY3ClZ
 w2s3yA3Gw7L6R5nbN0kqTKYbv5pyOow=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8IBOS9xuF6gv
 oAucjzL8YOGXIcUs+TfpqSbK2A2FZcZ6xkU72ajoSt36/avsXzrHTS7ZxeJOPuLXH2ilx0W3YgM
 unrBYOV3ddup+QOamHG+y/zRl//brZlKM+HDwgjO8bfaOCKZPWB6Sv+GhPFkEtEbIDbKHKU5rYQ
 PA01UnQRGwtByshI5nmmaA9R7nGj5lpjvCTMc2OdBGPXTlJrjmKesWSZlyTBF+JZmUQoU4a6bS2
 J2XYIy4AWxDrToGPApPdsMrc8bC4b7wfBF9PaO921w7R5GFtDUf2/sb3P+YL/sFEVATrS2TXEdS
 Ph4SOgiBtGx3wTGAVpXqF4kDyTUwIKuSwZ/MDTSbP/pjdmzGelITuOldW02J1iqYaKqO3fynLpw
 tha1WHrCD1bXg6U7RQdrH1yvzf31EOS+rLQPtwcQRAqdkBAlZOzzWaz5/2aZyuKFLWGeAOqkK0p
 vVbgQHbrgXSbX8NQ2EA==
X-Proofpoint-ORIG-GUID: Via1UfCrLIrWNDGussJAc5CstJolNZkG
X-Proofpoint-GUID: Via1UfCrLIrWNDGussJAc5CstJolNZkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

