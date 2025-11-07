Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB912550CA
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525396; cv=none; b=OZjxnp2PNk/lh2DM6hYoFPQoN3wfxZSbOethEgBdbjpjStm6CxdLs7SfD1pLRNnoiasejFkqz8M8kmRAQej2Io1kKR8yw/4cVCbmVMCBvdjHDQTCd61k6DgkliqhIMqgKoJzYEe0Potj5f01II5s61jdqWkskAy7jEaoS+IymcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525396; c=relaxed/simple;
	bh=4WF2qF+JmlZqW3TfWhi4guCSTWxjHU+MiXWc2g0vVfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H922B2TH0m4hk2Fn1uy7zy3bBhHSzoNB51SXK7WzkNBs19wnSBN6VbXM2+M7I4tdq8EWUeCT9q5wtegVFNQSDlMfqNVAAEoMA8WWVtu9ECRCWMdB9tZ7AchcmUsmSL+h+G9gCYcIWTcnK2M63tVYj4WDJNac3G474lgKRaarE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3EH6cRX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEd/1JYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3EH6cRX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEd/1JYk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7DGuqP528568
	for <linux-sunxi@lists.linux.dev>; Fri, 7 Nov 2025 14:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+a2S++AQUY0fS2KV6X2nQwoI
	E5xNiyzvEu1cwp1iZQ4=; b=D3EH6cRXHXlqi0AUa8ErSK/1mhyPS4IsS0+Tsl0e
	AbK/mcejq0gjANtVa4azJivGnL2Q6QXA0LKdmVrCcTHEUsZZj9DhP2DJ6CjF7UQ0
	ggTA/C1rlzOT+9M8Pa2aJF/tTaY3rMqzqrbaXWNXNffmJZcdi/nbXAd45omgtYwJ
	uv3MM6iBu5guuFBv2pXBhTNlOVL4/v8kH++WkUj6/E4yhEitVolHsiuwVWcRyXO7
	GVfkDkLpnBa0MosX1l5y5Lergwe/TQqWUDaAuq1aNkmZ0TmyHsr7V2FiODeyP4BU
	SXfH15gbaOb5W9uXsL1bFgonRW5+jez1Rf7aH8eocyMmaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905hu81m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 14:23:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74e6c468so11176631cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762525393; x=1763130193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+a2S++AQUY0fS2KV6X2nQwoIE5xNiyzvEu1cwp1iZQ4=;
        b=HEd/1JYkjOHl3PfwU9oWZderVfD52EF0uLDeUbyismj4JPtLM3uIkc6VGD9JfIrj9M
         0nCAAeGGWFzvmSAAoxgOUh5d8Fe0VqmcBP+a9jhGZJxE9UPK8vsQctPVnAUL7r8suT+/
         MtXATNNIykF3Zm91GNNrrBD93Uvi2piXdYx0eBW/sSxgL4cBPpPCLRUCSkUGoNbkjEzk
         T23Q0Ham2ZzYvJJV8YTJqC0gCcXqiAm4of8OCnYUJ5oL6AIp1UDi8mAqdm058Behk79L
         4dHdoj0CB8mja9ntz8VZaemzbTOvTDCMhpYjcAk4XvsJ0fBSFbdy8SdagQKfqHJUcNIw
         TOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525393; x=1763130193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a2S++AQUY0fS2KV6X2nQwoIE5xNiyzvEu1cwp1iZQ4=;
        b=lVo/bywqIniQozxb6lIeaFNx6CUcz8I1SVC87YN3FO2onLerSfq1SemX3O/nd1OpDz
         Y0uQFQ7ZF/aJnYNUFlyrJYd881jaNqrQxdh1SVUQzrZJkpvJ65uETvXb8HGqVS8vzyNI
         LI262n2TI/XWoE+Ma0R9rhYiBdCIM5N6uTftFALZ7gk0RK7rMBwKU8t4VxTe8xB89tqy
         lZ72MlkMDfYNY7ihhJu/qRPWarrTlQROoscUDVsA/rOBVe2T6juUJDvRQKmR7XHghda/
         sj8MwvlsdJ5/PvxT20L68425aTCEaADosrX6fvTFw7uGPhijp/8/r3DyWIZoItUraAni
         hQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkYQ0kf/1ByiBPSf5Dkvv3c2m31j0gtf45zjmkcY4yjBmNsh6U624q8TGUf+3ZO3lA8G3eEA2E36PX5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YythbZ+2y0dJI0MJMhfNAjaAEwkQIPqp1/ytTElIjzqRy9CngIq
	vTQ2tMVariLNtQq5VXwg+rmeibCdrua1x8P/ycZ7aEmwEbftNu5xwnAp9Is55tIvatKXcvVKMSx
	653s5YxyUimAJKpRN/35F/4a2Ujb4NmFcHFiEBjjydQcaITUtiZkWtVe03XFRos7z8A==
X-Gm-Gg: ASbGncsIO3F98+UeGr2dbFlBR4j9aGapFMTFJ0O14Z32GOqANPpBrUGl4EQ9LUPJ/a3
	vi+jtp86eeRHRJ+pvrVvH45ScJf/0jd3k0Y3FPQ6a6Emma8Pw+Bphv/gco19jcspLbXxSPt4YZz
	OOawxGXEok8lm9lbtJF68G0t9RxOz+tp29pKY4fYgF4yxnb/heKZElR5vBCNe+E0cSbHkxyrIln
	ck+8PoIzCvmOxe4ZYu61ezHjmVCDM5NXI9E+JALCWSKBhEJaGc/Y/Ltw/DovC2TNPqQ65ndw4Ur
	c7U+BOdcHcU4jwMtzyr2FD6l/gXggWvYcl8/BlL8ArcJ0J7zFqdAqzxO7IPa/lWWHShBDB0Ck41
	Zb6jmfqtp9QreXoVShsxGT2g7rTsKbmzOrKLrbnOhap21ubxBAZtTUpb9O6UYf9xTAmtgujJIgx
	1ZlAnzYNCP863W
X-Received: by 2002:a05:622a:148c:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed94aadfc9mr39449631cf.76.1762525393120;
        Fri, 07 Nov 2025 06:23:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3yaL/5/mqUrpztFbYMzYBN6uO1ENGma7JKY17KMFkOU2Ru1L93K1rV93BVrdOZy//IT/hg==
X-Received: by 2002:a05:622a:148c:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed94aadfc9mr39448991cf.76.1762525392601;
        Fri, 07 Nov 2025 06:23:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a014348sm1514752e87.7.2025.11.07.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:23:11 -0800 (PST)
Date: Fri, 7 Nov 2025 16:23:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
Message-ID: <rxhmiudlnrn2pexqtwuuv2jrenrl2ezepknvrc3o34gaap247u@2tsfw6g33rmr>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
 <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExOCBTYWx0ZWRfX8ryT3i/3WV6J
 Z2Wdkzzie1VsBdyZOuhX/UA0bdxDRivCUKdCvRanM96fyvCX3ig//kY5LFojIvFqdoUFywIEy15
 tJGR2PCgLduAsznTxkzYpULKN4h3VXL5usx87D2ZnPY6ZxvKDg5tGlKzpcdODLWg+HZ3xxqnTeU
 aHQwegU7TqbJD9xeEn/Q2q5PtfOk6jjEuYIjrtQW7M4QwIfZurmPdx5dStq+7dkMysKuMdRBdSb
 tqPXYm8kJAyMy6Lmr1r4DQh4xcSLbexrKCoIhNMi9LwdBlusLYsAcYGtOgm8o+HkszFwqaKpfhw
 fRzwycGE6VtFQ/9hV8oUqxOy2N+77ZO3e25jdkHwHnn5T9cv8gjaQnrIj91ob3kXPz6M/ww4gSf
 5Oo6tcy7WcAJx30FU4yZUzWJVgtviw==
X-Proofpoint-GUID: Vfh3-ik8wZRTsVmRCt9un_HIDWCV0v7M
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690e00d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=Pc_8zquyR68SUQC9iicA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Vfh3-ik8wZRTsVmRCt9un_HIDWCV0v7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070118

On Fri, Nov 07, 2025 at 08:08:28AM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
> > On 07/11/2025 04:19, Dmitry Baryshkov wrote:
> >> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> >>> Replace open-coded getting root OF node, matching against it and getting
> >>> the match data with new of_machine_get_match_data() helper.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>
> >>> ---
> >>>
> >>> Depends on the first OF patch.
> >>> ---
> >>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
> >>>  1 file changed, 2 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> >>> index 1bcbe69688d2..07198d44b559 100644
> >>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> >>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> >>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
> >>>  static struct qcom_pdm_data *qcom_pdm_start(void)
> >>>  {
> >>>  	const struct qcom_pdm_domain_data * const *domains;
> >>> -	const struct of_device_id *match;
> >>>  	struct qcom_pdm_data *data;
> >>> -	struct device_node *root;
> >>>  	int ret, i;
> >>>  
> >>> -	root = of_find_node_by_path("/");
> >>> -	if (!root)
> >>> -		return ERR_PTR(-ENODEV);
> >>> -
> >>> -	match = of_match_node(qcom_pdm_domains, root);
> >>> -	of_node_put(root);
> >>> -	if (!match) {
> >>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>> -		return ERR_PTR(-ENODEV);
> >>> -	}
> >>> -
> >>> -	domains = match->data;
> >>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
> >>>  	if (!domains) {
> >>> -		pr_debug("PDM: no domains\n");
> >>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
> >>>  		return ERR_PTR(-ENODEV);
> >>>  	}
> >>
> >> Here you are mixing two cases:
> >> - There is not match in the table (in which case the driver should print
> >>   a notice)
> >>
> >> - There is a match in the table, but the data is NULL (the platform
> >>   doesn't have PDM domains). In this case there should be no notice.
> > 
> > 
> > Why? Existing code printed notice in both cases. Why refactoring which
> > tries to keep code functionally equivalent should change it?
> 
> Ah, you mean there was a debug before. Well, then I am a bit confused
> because table has entries without data (so expected condition) but old
> code returned ERRNO in such case - so unexpected condition.
> 
> Wail failing the probe on expected condition?
> 
> Unless it is not really expected and notice in second case is valid as well.

If we know that there are no domains on the platform, then the notice
definitely doesn't apply. Failing the probe is a separate topic. The
rest of the code expects that _qcom_pdm_data is not NULL.

> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
