Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6591390212
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339886; cv=none; b=QVIsj/ImbV8DQApSK2ZdJs0JT/rXS9o4BYr1b9iD1U8zvuTOLbOJsidQgv7XWkT2du0Y1504RCAe7Gf9QgHduJn1cBSb37TvEtAng/uJmMSbNNlo1xd+AgfrHmEj1Tn1kvzLogVl7gr9K0y/u4PEsUz/zkmtICBjOGRAEQ/UX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339886; c=relaxed/simple;
	bh=xPoaboMMdHnZFam4HfRn3NpLX7dSPbRXi6l5ULEulr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex4xagP3hCeGtis/cl+1mUVMRE9I1dJuIMRP2ZRaE7Yk99UEs4Yl5ngKln3cxS5Ka3Aya4LKcWQVyTx+NKJljJ/shCqo75HF+FTbAWkbdSRW1xGxS0YRgmYm1UmGNNgUzt2UxiiG2P0k3j4+1tWeVe3L/j39EcmLug46XbDN8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSN3ULp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cklgm9jc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSN3ULp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cklgm9jc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxkxK3775925
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 22:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btDF+i2KLcySKsRDG04ke9EX
	GqLGBKkYRlkEl3KSsbc=; b=cSN3ULp/jmbD+RpqhvAi7G4b8xI5NHqzdYnUZhQk
	pqRdi8OFg4yp6abdziJVVvNQxLPekTUoi2qzD+Hf6CUBJY52mICx0i+Ild//Ou35
	cv3WwDThVV+NN299SEV0hpMYpHSNwQ+6XYCpWNzK4diPVU90zzLYiejU8LUXjatK
	ocOuYsNom8HvdaXAbadzhrtybdJLnz2OcOF3OP2UVbplsG85bTwkdndc1wOrUOsi
	22pcbkOiL3fe+wZJUqic9K/G/UBZx7yiNiVjQhvqDoPqLjxph6Z24wMWk4g2d559
	0vUESeSvhT7fybc3nCMhBJN4uPKQrfSJ3Ye7FY765JOdIg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cm9nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 22:51:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79014f0b44cso2527488137.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339882; x=1789944682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=Cklgm9jcUG5LOC16VbPETf+Ws6OjN1/4s3s9vCUUV4DBjJu7Rl5U3EGV5Kyga+/09/
         /fy22XPE3vt3OE69QWuC27a3nwclh3Evz8T3dmNkwIKA6DcDjvjNIJ6wjGaSNcoBpr8j
         GzBaYgBKuZu0VyjCcSPmg8uy2jLIpCD/5y/M5nvZmlQ5wVCqm2XOZY/fhFWObNHcX6x7
         1EypLrPtSRkydgxkEZhnnIqhU0UeNMh4FhInN08JnA3lNcULAk6rgS5iODNwqxfioq36
         BOh+h0TwFvubXw19SuJH7V7ABHlyMKT5X/SGy/UT84Yu0nrWt+25H57Bhj1lFVRzg2Wr
         clIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339882; x=1789944682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=b0SGdmRoEDAXHjSrOwa6FxqVX562LJ6OOSwWqjUON4712q+Ptml5GZ8EzxFrrkBg1E
         sqkdaIW8TRVkgD6B4KzQdaXs0+WnYZJThNAyhOfhJc7Zq1XSGvtLGRt+0TIChaUVH049
         jRmE7/Esfl2UizNaL8Pu0lAvougGRgZDG9VEtK5JX5+y3R5O8sD4lcrPtHYEDm7QzS55
         f4JygtsEmnAoY2NR7baKTjo3A+x5O5kHB3LfwHHldAvprlQDSnkYeqcTnRrhP4hJtjPv
         8U/+YG2smJrVj/t6dYU+5fpnO1URKhZx7V2mXLwkrV2mzkqiW2IW/i5YmNaaUiNRyoKk
         QzTA==
X-Forwarded-Encrypted: i=1; AKwUvBw/ZDfuJXPiFAG44Yw7Z090UAty1EUQmE8l7Sy32JY8rzHEnCFeKaksUjd2ATJNdXuxnMKYe14vY+GroA==@lists.linux.dev
X-Gm-Message-State: AFuF++lmwDmWWm97McngyPdozK0UQSZOnMww1Ybh0/viCY+uTmAeBFTU
	tafgC8IZn4rfJgExr/2cKImKnyzyRonsqSb2ejv72o/xK4i1f+ZyNdj4Qp7NI9oDAmU+v8hutV8
	czg7plGC/YNz4yr/leAi1i42wza9SGziaQe22LREq6r07WA/X+AgfZunphYD8uikvoQ==
X-Gm-Gg: AYBFou2OnDmWXLGnD/MFDIuB30URm5FV998RQGi4HFQC1FcVtCBo3DrFI0/+tbDQIvb
	hXnrVUNYjmchWeaCC60T/K/c42rulMjSm7IMrQl5KEpakwmCtfTNQyXjR0LmPVC5odi+C9wjNyc
	537harGZlZ0xUvKcEIbG6c2Iilj/5Zr0nTfuUlRXctWSQGzHQQCY759F9VDiQCj0aTDCbvxDxHe
	EXwz8PKg+ZRAuw0/sfHtTgb4RPQbvhmjibjkRlT/A4Gc8cxqLtYK6BJ/aUB4gxCMNeFugVA/C/U
	5M8qZV3rHa7WM22tQSL0etmyWJ9iILNDM4VPJFSBi918nIhL24ESyL4fpGETpmbsAn4Xox83sGR
	xLzjbo4AjgDUW3TmGmTbAZBhXgOWRMXYRz7ojlxiApxpypPU4p1oVVTjbPzkn1mmW2hIOOXOwPp
	1zsvsO5JBtGYRc
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888854137.2.1789339882090;
        Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888827137.2.1789339881698;
        Sun, 13 Sep 2026 15:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2086254e87.80.2026.09.13.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:51:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation
 in the example
Message-ID: <acryik4zjxxt76ldqk46a3wymgettocilimua4tlm7wl3tvfo7@yrh36odg6fju>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX8KbcRTdjdvrt
 BlUBvwF7g/lAEd/nnT6qB+LxZWyXzHM2uvfHtkOF0wYrY8XrOieUAnxapJWgU6zocxOfhIeZq8B
 Gl7YcXpNGwk1rNA1424sohW7f06b/C8Cw5i/f/iD3J17qTiAMmkV/dVHq0dTFq0hNK9rzs+Hate
 evgZfDL3n96Ri5pVlkSabRE8e4cYOgAEf4xJYY52K4pM3wniV1nRkc8EX7GAkAKGIhlAXA3k/72
 BxJVSTtMWDoE6Q64A1M+5AGLTyB30BOUPfXcjbUdDfM+Gl28dARqbUXK5oiLk2xWjzNzl756EyA
 ksbPQpeGiTJE3eP2EOeRBLmknOZNKHOZfvCviGzaZiVV67mPfBWOJ+h20UMqRXhm/tBEjeG2lk0
 4OOvMZ63hRtu00rnxRj/N3JgROhBVdpSukwjJa0wkq39kO6eWt2YPVdiAzhrbcAImG34J0W70WM
 ZNFVAdTNk17k2UMuoAg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa728eb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX9toEKxqaKj0+
 5u15jfPkfPHO67i9oLTkveY88wkWB1oHjUZ6wku2rmCBynmisBwmewkc8OGVjxvi9cEVEzQcQhF
 qZQ2QlGlN9/rPt023qmNuHNHF+i1iRA=
X-Proofpoint-GUID: 5knsU3sgRo1H8xa4Rjs3obfn4GnpQwmH
X-Proofpoint-ORIG-GUID: 5knsU3sgRo1H8xa4Rjs3obfn4GnpQwmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130327

On Sun, Sep 13, 2026 at 02:33:33PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
>  .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
>  .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
>  .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
>  5 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
