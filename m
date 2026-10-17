Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4F3CAA3A
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255372; cv=none; b=CKXAds+WJmEn0HxnTzxjB5iP5aPeTsQs1xTCUqgEHVc8luBYtygvbovxWKmcMhF6CNsvZGaa3tCs3ynuUPXvwiU16pP66yDYkQTPsDc9D+qoQ7TqQ4WzmWZeQapaWFeBXvIeZ9us/5UYlBCo5axHnZ6eQ/M99uss9ZWcS/gsazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255372; c=relaxed/simple;
	bh=oqtbq2GGeLimTwMiPXXLtV6CRd56cCRXZHus+yXgxlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSQKWRjdM/barhAelcqcbR8OYaWS/4riO10lEH7HcYI1lEdDFXDihq0xihG7HcWCDzoAdh8XFqi/kbhqkzaWzN5M24NvAvgM51esxwVEGMykBWloZLUFz/YmxgPdeEMiat/9rx73fYcRI/LAOeDTXSY9x+MHxeFlzt34V4lT9A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNhoZ5Km; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJGc6ido; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNhoZ5Km";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJGc6ido"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA1jK1332737
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnsnnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 16:42:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1863201c88.0
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=gJGc6idos69554Nck7+7p7e4OKccqT2chIYhpExPj+XIRvaOSo9uPrrkUE9PG908AA
         gjW0wHGvAVLWCKmUWr94xh040wRfcj87h9D6iDPcZVWbH9OCemwuoBS7OnlHEIlsrLAZ
         AqhBDMvPKlYaByHyHrvYPbJ5cxLRiU4DBXYMJbJc9sN+G1zhF2fXyu9sWVmK6WCtvgby
         2HEGI+DDP/IwifcOBwnRB0o1zJbi67HutBNIdKcLEMy3O2I0JLM39BU/pIHwB/Lv+INg
         yy8+Ml9wiJQaS9PvnTB59w4wK1y/aPuvtAJb9SqvIqZdqP+0V+MjraiC4JiavmiVjiPH
         eVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=PEjBM+vwdmFIozXFn+jlaTVjQNUTHEurOJpM+B7O6vAFzwyosVi80zIJB7wzD+Ty1X
         uDYqz5Kbj2G9W2kyUOPiVnXvycEbk4cpbLbJFa060fOKL25MZWlN6Aorf1O5JFyk8cBf
         ktIVERXeeq11SqK3rYz0GjYYMfJxfj3icnbU9x4aZHBsrRDxDW54mqxzr70GN5EZMsb8
         bikXWXg4HvZ7ZW5ni7OEVzxBykx7DysAL9dmCTW0fdKJ7MSUvuivItnbjV6oBoQpkdlA
         3gbEAXk6KG+0R5/4+tMTroVu2q0k1XBqLTV+LbkV3U10RfhZeMxnXMH8MjmCIrTx5JZL
         wwxA==
X-Forwarded-Encrypted: i=1; AKwUvBwRQ+GwdW4FyqhLIRF3a0kEkfIcTh/OCZu3Tv+gWzQQd5LRBucvodKzLLaN9eHe68wfr6AUxN+7ljZ2Iw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIa09KG0YxBKc511P/ahe/esfaIlhgXPK80PwI5Di8dECurV8oM
	B9k0yrckFw3gmXts+iGZIAsHDEwNWQcN8V144awwlZ4sJckYXfwkQFlp+LpKofn0ya401aSANt3
	0umz3jHCBttPLYqCx5WuJXEp1si5vvkzlscl+OOUzR49483KfStakkGunZieFuGR5aQ==
X-Gm-Gg: AYBFou0UkZ7B/megTa5UVc1LfoXnlliL1rqUoHHJm+doEQuQqXblRRDE0Ih5Eg2W5OW
	26SkNw0tzON47JeUwu0eCfwQOQkSeLqyaLahAlYuiolg4/DsREDy2mWxp/UnFv9jZgU596aUPJi
	kdN3vqTP1xQydmWx7xZSl1YazafPn99pvs2fpaPJvDz7GZAw+5H+Ws7QWy3ClJUIaZf/AwmdIPd
	mr7YGM5k8J+Upz5APs7AzyeVoWN86NveHJCYqNHbEItkbByiWus/QZZ797FXaFAcoMiyHiemOMF
	MQMsQteiLjJKnxZ4+e+7ZRVDXQjNPwQzEdmaM8Q2G1ItHc07ArNVEIaaoH0LsirTviJ34SMZo8v
	CegdHvAQbGCMR4w==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689719c88.45.1792255368722;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
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
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad3a589 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: whXW-fEqtfyGYDddoLfDsmxj9UHqEny9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8XRZ6l9pGlpM
 /EmDw9wsy/wf8G/56kzUIES2/DbfsyzhUi+L4xtFbmJdhHiolkrE5kN7lu2HLN+j5TB4OgnC8U6
 A4K6zr+Txpclz6+rOehLqfJAvovTKJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXz2yfJgcjoJ/+
 7R71Jp0AoRribBLTOhrnaF/1YKzscx9pbUfQ4hafiVMu60ljVfHxXlPj6VcXsVUWABn78qZhwrM
 Hip7UWfJghqFCRVNs9o5XFo84EyD7jrH6c43rvJCPPxAkzRz9vXIuycEfPIUQ8TSkuAkFFP16CY
 zVxGPpIpS67x2b8Jch21h7R9XbhRFSP0LNqOGneYICH4xf1Q1WcySNOfb24GhyqjXmzyMHuhSFc
 re8D2EVjjjNRNXZihExxseWkbxLNt1+dhca5V/60GVATczBGpcPKYHLjSVQ8JpCzZZXpMl1iK8A
 +/DikU5MT7ARuGOnWevlkiuDfiPvkNfRmkXejKHVDyMKfprI3QQMuke+uacj++psQyF8fS/98/O
 piZ/Xu4GlGAJj4uaShh8KM1R27hHTsMsHV+7QC5U+m+GGeOJ/tlpZJC4LyhDg+6POHjnl6ZaTAT
 7KJ+3XlqosQfM+qf9xQ==
X-Proofpoint-ORIG-GUID: whXW-fEqtfyGYDddoLfDsmxj9UHqEny9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

