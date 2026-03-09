Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C24396D31
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054506; cv=none; b=e5+IlyZ/uDb72nhl6q5Q0krSrdJPFMqRJEOi+q9W9t84u/3eQ8wD9N45P9Yp9rFDI55eOyOV2ct53QB7ny7OJZ8JNWz0oLojSmjfbYaGF0IzgqKjjgFCG15pZsn/kLv84HAomYHIDUBceUVzVrQtO/qhuHyHCgS+sLwhXj5IKsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054506; c=relaxed/simple;
	bh=haZYw/rVRG4cTY6XlUED1nGXUhf7pYB6b6bzXHZlX40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyJEYROLrXPInH1XQdvgRNQbsdLrX+u3FlH7IPYSmPw8hdmSiybQd05Mk0cvjYpP/fqSoMnECPqDWfTxZWRrMId+KaHBgryVvzkT7K02Iizi3jnB+VHL7KEyiNUKpj6KDHsLnLOwzo8b27Snqx1K4GObojdRbrvqfp0JCSOtuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub24Gv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFHpqTdP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub24Gv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFHpqTdP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989XE3197322
	for <linux-sunxi@lists.linux.dev>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd3vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7396634bb4so13164788a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=kFHpqTdPxa6efc6faAqQvYHPJ7x/Te4yotXJKO56e1TE0H56EfXuc/mgH//bfAkESi
         QWtpH5z0KugMbb7Rhtbu+sHTllRHmAmlGyGBdCGPguCWBRWz1RMy2mx4FvmufHb079tL
         eb0qLUNX+vIF+xnSim5gGxzJ9vA4EjwAKoxajaYaAZBAgyYBwA5dwAUol3nxL2rEzjV6
         lrhFaJWuJZW+Kc1qS84sUeHmAeC2TVpSWCGVzjQUvLGavBa35z7oglKr4u9KPsAreBkz
         UIP5kFBSK/l6oeFI/MRWyxtckaBeJbneDGcRCZFMZpekc2PF6wXdV9MLFe26ICuRH7XB
         1J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=uOJ8XQcgI4V6yqTQI5AiPskcK5HmAV4niwQiE+1kCDtf9HPVrpUZ8c7jUvZV3Wo6k1
         Tg7jh3g+morlYlSxYVU59FM7bUguxMvpOKJ0W5Casv76LggHM1Nlz9yKTFTfTUbAiO+4
         Q6pIJzxzYniOkCZEvscNNdSePNSps6YWvv6MeR0TjgIa9yJ7+TFrHKc0P6q2WgivpPjt
         5Eq7KtURXNzQbou4Grp3G2UMrE+byq6bKfl6cmVyKTU1GQGmy+pyTdvJM3xu/ZzRm0Yt
         cgZOa+4jAcwsDSZHiLPv4AJ+qx6eToG4gY139zXPh5YpJx3/F+30WY0D+r5QCbkU2zbi
         zgOw==
X-Forwarded-Encrypted: i=1; AJvYcCXr6Lx0QebQvN96c4xA11VJK/72JJnyEOlaOcIgT39dCOE5EimdOW7Ho8h+9GYewxnu2kfyjK7bR9NM5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvbv/zeWXklECz9kRvC7Gzz859JWnKwfFGmVXWCR0Qj9ZSxMPT
	8Nhcafoy3hlkVWMgUlR5MxMwMmn9TREZS4gjOX4uQBbvjiuCkoZN5OOi9Eu7GDSM7v7GMD6nyrZ
	rRUTaITQwQNpHELF/ljuaKfuFffn/XKJvNz6R9pMOqubmZ5cbre4aF+nVGvy/7/M+hA==
X-Gm-Gg: ATEYQzxIQQXJInDRC8xVcQSKqisgM62V/8I3hQp9jmefBXGFnkxELwAq3A9PzoVZD83
	Tuz6JKPsnbShydDkPr0vNOlZB+bw2mcn8GJDzrMycDLMYUhINnLSWGEdRKjqdIomeo5yDHMmCuf
	pZtk8weyuxqse9e2egWjktbaZCPESKgOdtJBjq/QO+AhzQXZxYNXeNDLqiiHuums5cUfMYVRMWb
	/OUVeF9EAirMNcKvxxPD3KgSTfmHevVvfD8ncaf2YGX+rJC+RENUHC07knrTvUcsJBDOmCfpD9I
	dHfVFmzlWWOyXXmTBD04beIGeUWFK5ZvwjROd6f52U2HkYf+8MyTpgiKdqIBm8KsKp6WTT80PcQ
	T07rpkwPRlRILupWlYh2aqklY71eitHD4vBE=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232878b3a.34.1773054503060;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: a4DBG4aOQ56YXMyco2daTjdeoOJ2K9tv
X-Proofpoint-GUID: a4DBG4aOQ56YXMyco2daTjdeoOJ2K9tv
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX8isDjWp/uIEz
 B//IPkVS4v/8BS2q9UXMkiaHa0hcVNEddutvUUzqWi7swNzxxN05y7kdLS4qEN0rc2ptQYJXFvN
 tOku9OewKmZRXUoswPNXR2LB+tKMya9CdHYiYKvZ1U7uEcTU8Bo+NzpxeDkzgMQ1881VodKvyYz
 N2448KBcTkxPC7ho14MfhUuOqDK+PKCib+1Q65hodeFX+0wyfRv/P512G7S6qGbyFzlcIPpaOHv
 9BTxBetGDmWOX32E36Om9yl6a3Dc4wm1sBKbf7/Ae0iQUuaO6+uphLg04ILLrVGdZBJ6tVjJkn7
 yOpXyB1kZvS2f9YpyPD1v3ai0hi69P0qcJWE/wuMnsBdlpIEzflT7SYblPzzDtSjoQYKbPqrdRe
 q2fkKJaD5Npq+oaO29qi3GrZwDO7iTK++gfrX+G3ZvyDqntTch7cEVv0vk18UmoqUuDwxy9qvZM
 GzwoY8cJz0zTuebbWdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
