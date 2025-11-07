Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43BC31A07F
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512600; cv=none; b=DqtamqrzszIT4FIDsYAFlDdpg1t8dAQneIHsl/kuAJAaq+EkkQPgp6Gnr66jlUBNgAMXOmmA3OKsFGTRFrnNPN7vTT90jAOUtia4H/8DeZe3NTNyhp6c0GT3hsPqESCnxl9jvvWjE6pnfg0eYEzqphV2nQTjFL4IZwkmxDJDDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512600; c=relaxed/simple;
	bh=k6CWVoo79rJIhFxcP1Zi6lbWRJyVheMfi9XXd+LkGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvnEGE2XnL9d/inR1bIq528MJSthDNSNWTgTSXlkfUPIt7MDGVR7PnjQCG+1yQW8v82YquIE/2GXqC5j6f6rthrhK3RqauN3R+6n2EXdKrLeAcxKTsmPVEeZZlTYbVpqOjAFE2Etp8Uk6WfuqOKH1AZhJ5BGOmpX5KiBiuWXxjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j19zi5vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpNWyLpt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j19zi5vc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpNWyLpt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78f7c24131369
	for <linux-sunxi@lists.linux.dev>; Fri, 7 Nov 2025 10:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=; b=j19zi5vcZvZc+J3h
	eil5EXgb7o+MHafKBi9Slf1MAsHwht9ShJKuhVBN4IuNbfkFvOasu8HUs+laic1i
	ApQFCQDDkr0nR1Z4s/mFsEJRFNaTWW7B62zkTCNyqa8FVCGzmDgnRi4aJaWpx3yo
	7YBrhqEKVuWBhNuAaoE60NFeKFuxZH+p+rn0tyDvgwMCTDDPUaOdyqcmIN20Yni7
	e+FAQn327eA/EMJkdOZ1oKcI5NWQiBeaIRCP9KmnXRYAWj3UM/IlF2kolv1vNI8Y
	9Rr7K9olNJaawFxFkksQTdDzKZOepplYR1QpfkBYS3jwKcxtOTKS7ODirqnsgtuo
	rorS0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3rrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 10:49:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed961884cbso1928401cf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512597; x=1763117397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=jpNWyLptGFooiFNSHDLaXE5HjnuCuZ0g8SokYNKTO8+IVCdAwR43MCs8tn08eVT+RM
         R1BGP4gmpUrHhV5NnDk//drYG3iF4d52YNireJK3BuJHPBy1k2cGhi3RRN0nY5IziRDo
         sVExY7BG+RN5i6HvdfgfqEMO3YGxx5YoQ3Y8/IouHfzcBmbdpJjj4JgOMdD/tYoz8rsm
         +M0C86hTEeaCZSs15xKiQTFFD1fiIF233CFbk7kgiMZ590CPUvlszHJCeKWLZZk5zwtd
         oyackZhOAD8zEnBb2FyMOTBKyE2FDiwQK+XMzbTDG/GGwA4+wHn2sv3dQOdxcwDH/aOZ
         HUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512597; x=1763117397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=s7533aoTFBvFD7uFE6QWH7WbTWwLFZ/ojGTWBt+5W6N0X3okANF7QHJWScOTFqBLXf
         iGbwEua7DJ2JRCfeUwL90iBzZ0D1sDQa8XU7fv8aDDYt0ktCTS8uHWC1pwHYwkNHm36/
         tnmN81eG2hRGNdltnPYHAEMkcJxj2Fjmek4InRFJMzrjSNeU1Xc19jnohgXEDuuv2IbO
         RZyvq2KG3jZ3uXANW33Jb6H2hiBmYBs7tnpaYpfcLn2Z+d3V8QKIR+U6rJp5Ov8beJqe
         776sJi/c7NdeVl1mCOE5usmWEvxBMdpqno1aMvUNFQLH0zLFYftJJkftE2EGdf92n8eM
         uQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfInRftvg6cOFbiWO1qknNJx9mFSx6Q1/UTJciLhnnVZibiNmRV4h2GmG3oWcBPDuWg0QYEPmB4o4lgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQT0a+L8JvwXLJA+ZYcnLuqaVWZ+7bP1Vl6H+XsXAvS51qlTUZ
	hWGfC4qQRBkomtM0YSs4/5gCqjf3tCGAmxLyplpLLgBL3conwx+qR5wDYA0J06XoD7GKTCIK9VV
	SBCFie+vy7RovSc99+UVc+KbJpQhaJSpcHe5EecBkj7xvXXQDMAz+N9F5ZqBjRNBfOw==
X-Gm-Gg: ASbGncvUJff307DlFhioYsRQBLoqnz9rzPjlasCQSGlp7Z5hZMpWqgcUOzJ9TbjBX+A
	bpxt3Zrq7TKuHh7tnf2l7m0nXs4xUnrn1jxwOHWP1IgvYV+pCFp/12rybGhxi5ILe1J0Vaj+HzC
	6o4PGxqt6sMG0pI1v010JN2ZHA77NmNfbPgPsTglX1PT7/tFRGpKvNQUu2D2apqjWevD4qeu7mC
	t56x+dIQUDTg+e0QDcIJEi9hL2ZTcaLHglEVrFsgh22YugNPd/q+vvyCeEMYxD1gE3NCmCRY1+h
	wezimgWyX4yAxJ0duQj7ZjdStAbNQB70PWFEdTxNU+VMSAtZ/oYbx9C3w0CRC7x0Fs7qrZ9M7wK
	cMYVkJQktTw516fK+1gIbmGBqK/QqlXUe6ECu8ALwK8jB1K2OW8YxiQX7
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18063161cf.5.1762512596807;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb3Xbou/G0Zzd63eLA+eutWoqm0V75Q2RL/wdtW4sHDSzQGKhPaQSn2W6oLQojU83FQkCi9A==
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18062921cf.5.1762512596362;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc2fcsm204678566b.50.2025.11.07.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:49:55 -0800 (PST)
Message-ID: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:49:48 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX7JZoxzGeOqsd
 NpC/sc2taQSuameISZGYfsYOug9sHiv9HssKSVhQQhA8lgWndtq/u1W77idPJ8B9GRSgT3J2qO2
 mAqkP+E/qqAGQRuTU46u3/YZjF8S1P6iTPB3sPFLFTuQ0+EVBOF1ml91dldlotd5vK4+I1BxNqS
 6So9BAZAPNc7gSKeQNA6BxFBZMhjenzb9Wf4lUkIBq2lotvGLKYZKuufJOHV0UZR7b4P4xhPnmR
 haL4y5/ctuLhG9E7p4X3tnuZcdj6up2HuGcuOF7pbyPxjSgoLQGjuYqroEs/1rypOPm9IA5gmH+
 U7F0uhgO5KpZibn1ADntzev8BqdWta4Z1+tPv1YNx5CZChO342zG3cUWJgxSq8YFtftyCKZwcvW
 rjSG8tEi0JjfHoMrcM0heSfW2LhbRQ==
X-Proofpoint-ORIG-GUID: lYyxK3nNfI9CBMMWKzn-Ln6TAChI3ioi
X-Proofpoint-GUID: lYyxK3nNfI9CBMMWKzn-Ln6TAChI3ioi
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dced5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=xTS94RJRWet4TjKJq7QA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In order to drop the dependency on CONFIG_OF, convert all device property
> getters from OF-specific to generic device properties and stop pulling
> in any linux/of.h symbols.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> -	if (of_property_read_bool(np, "snps,tso"))
> +	if (device_property_present(dev, "snps,tso"))

This is a change in behavior - "snps,tso = <0>" would have previously
returned false, it now returns true

although it seems like it's the plat driver clunkily working around
not including the common compatible and inlining parts of the common
probe functions..

Konrad

