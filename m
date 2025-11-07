Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6121578F
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485580; cv=none; b=bDYVaNad/ear96CAm873DUp90VCaFutWXMydufetJ5RuNROlgvv5XsSqUrYBHtqvnybSYPCfgvySck9wLQd/CQuOHWL3+GHgFLKaMC2nEpzR50HZq1qcsn1hs5CH1f6Gesc66/+bJ6j4AdXU7sNGRxgk+Mie4ZiS2mlzTKpkr2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485580; c=relaxed/simple;
	bh=fJDNuwwAh57qHVcxO80jNFIvDtORwu03rxT7N4ZqhUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW9uKcw5EMkVuXfOjnPtpgEdvIwV6Zz0QW/WTzkwIM8LjWNYqW7Dqdku3P01tX+Zo54aTELJfVMTCF9VInEgJLzcoWLI2i/k6AER6ab/If976wS8SSR7/Sn30huw/HBqlBrgsjqE4QngOZV7gU6aRQUnktXjIpq2nLuOZ66i3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBHaAfNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdcrZjbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBHaAfNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdcrZjbI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A71Dh6R1719991
	for <linux-sunxi@lists.linux.dev>; Fri, 7 Nov 2025 03:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BrpjAWiwCyBIR4NqBN1fG3lV
	zpUvOEKnEsnydrbcid8=; b=jBHaAfNABCQzblEMPABGZ6Ayu8XrzJog5gBepCx+
	d6vBKxEi9ASrvsstFwGiM5jziNcsyNixWVSXOvvfTqT2ssIzJ1xMbg4B4uJU1J2l
	3rJlsUgyLpK7kqRPTn5mg3/au8PUDOZukxF49NQd8vt4crfiltFLpyghFZ5m+n+V
	bqAjxvVeLlzX3R9hah2xXNkbxy6+D9AMOOKf7J54dQABmhEYA9XOeTuCmzzh2Dx3
	d+iCR96epD5azDtJaj04sY+ClRIH5GN07VxSJ4AKVJYx2+7UOEX9y2nhXHxjyra9
	IkhtI9n40Lm6Gicu8VxJXaAdE2+gprK5qZZp+m/mZ/DFvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96x0gaxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 03:19:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e892f776d0so11575671cf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485577; x=1763090377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=QdcrZjbIFWw8bMqtXF1ixubtVz+2tI+fLRzyJMaakBRXtkzFK3zBL9JWMj3z6Sa0mG
         HPz5q/FgpfnnFREn4wBv+Fx97a2TjLS1MC6OCfusTbO6ZoTzfP3r79ner6WHH3RlC3Lx
         Gm5n/aOCt6d5bWTfcObw1wACVfkqRiZlwW+RfcgXlPNO+3+TP6ZAFEMBO0R6M8lOzyZP
         4hV+mH5TjbxR+7jwejP1vMwevUDpHDw3goQzZFEiBFuRtOiTSkvXIjqjSPIYPhtlrxeV
         YTfQH0aWqzmCaL7h6dVWhrUBKZt5CIm0UWcG+WnuARVLfUrJVfI/sNhvEzv9eDW3OBym
         pJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485577; x=1763090377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=opvsXJKJWJz+07Wd4ZMX2meEEpalqiTuk+Gz14+R16F9hNkwIo08Y6rJIo0Zn2fc6U
         3DRMzwLXpOck3TEwzgNsW+nqeQF1+u+SNOCEv4G8DAuu087jRuUu9k5/cDK/VTA0Pq24
         6iM6pjZ99UMF7Y/nxnHLoTcJLHqP7o7IwajlnC7JUF0ixjGp7Sp9bfJx6sX71MEZJDmU
         khnUytnpv66g7Ko9aDpR0i+jnRdzMfeakauY1cxADpJYpAnLkq6FJ80CUYcAksWiGbmL
         UWcCJuqbriIehwHV7mbTmCEMvCHTjsGcxPSpg13t/jilcGkWxEH7KjpR08kqwRbyc5au
         3xWg==
X-Forwarded-Encrypted: i=1; AJvYcCUotU9Mv+9J0eQP4VypgfttD9WXf6Kl3uitQjOnhzXmWA+MZtY0JYmJ5oRFT4HXLePdTRCn/QoGL3BtyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOXK5/+jXIKQRkD6r/JITv+AacVLSyrNmhJbd2CsBwLJv6FB7Y
	+jQnqfBNYvmYcsn4SWugQo2ajxyhTDKe3bGWp7qJ8R9S4iviPmkkjEzatWO2tjFwsTg0+vYkkQY
	A9CzPvlCm9NY3WCEQpwcA7r9v7Be6NXZcVZSrV965fG6vA6wBE8mtAlnNGy3nSOIyNw==
X-Gm-Gg: ASbGncvPOqwPIRnIjw5XFvYEoG+Rz9/ZAP34Fi1zQgfaqT9wBeBFfquBF9BUJ8ZVTjy
	d/MVsL8IsE0BhEiFg1QpPewAK0C2tlqzbJ7bvm5neK4/LTHnDXA5EK1nKAKX0MGQaXM4FVAivXx
	EYietC0B3J8lhKvzQZwMHHQzsN+znvLvqa1EUJEbISU8spJNTWYHI8hm9uUTzVErShOE6RdO5Ce
	i7+3jZHU4tdiu9d3OVCPxDX3Adqk6JsHYcyuJKUp3TrqVjUFKWOJ7jxyECNQtIuFDjKFcAASTXo
	ipPFJPOQflgO5lZR87zSo+hhKUIDkbzeGn9UYD5JhPXNLEZCJUBjWQF3YeI0DxYAjqW5iHVrkw5
	tpZv63UUD9f5kc+vUGoCIV2Sagv2ezl+gROqculu7Xwr1dgGarGPH/oyqkh577Tr7pr6ynvkQHV
	GXGLIUUQQrq8ML
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756791cf.16.1762485576951;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/3FjNRKucfvNXkDZbeGXLag2dCvNMAIUYAMoAD/S9Y8MWbIoOna+co2re+tgJ+a1VvKEhZA==
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756521cf.16.1762485576496;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019f09sm1147166e87.31.2025.11.06.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:35 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
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
Message-ID: <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
X-Proofpoint-ORIG-GUID: RfUcQVxIHHns_GSA_YV-aTt1mf58xbHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfXwx5AKrOiukOE
 F+mLG5y71QBo/MGz+XQw2xafQfbQbg9xrmvsMn9F9gXLf+SaJQhifO3MvK8YgS/3li07AwcmWiF
 ggykUwMpV4mp2rdKtAoQDlj3ThQWCevbHzkkeGeG21WWmJEmkU1pLt8MQNA+XI0rbPQlsJh5Q1F
 6wwr4BsWXdowvseUH2Y3J0fFAmj7FDMiMjSprPAP1q/BBgfXcQLXDpmgyCZzE1mvxaajpzl9867
 dZA9Lhn6fWfujnIGONS26E2tE0AkkVyTbOv4K8KPezUeMHyw8A0g+zJ0XImI921dyqHiDKbBlrL
 s16TwQuxuH0pgWBwQ0azvi6zH52dYM7mA07/uezbFyJKssU8I5kQxtQcQJIQIhzhJewUC8cKeXs
 CP5tZBxlPX5AVgUaJ1DBeuqDW/wlSQ==
X-Proofpoint-GUID: RfUcQVxIHHns_GSA_YV-aTt1mf58xbHS
X-Authority-Analysis: v=2.4 cv=Q7PfIo2a c=1 sm=1 tr=0 ts=690d6549 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=e-unOtBAnIuy2i46bukA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070024

On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..07198d44b559 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  static struct qcom_pdm_data *qcom_pdm_start(void)
>  {
>  	const struct qcom_pdm_domain_data * const *domains;
> -	const struct of_device_id *match;
>  	struct qcom_pdm_data *data;
> -	struct device_node *root;
>  	int ret, i;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return ERR_PTR(-ENODEV);
> -
> -	match = of_match_node(qcom_pdm_domains, root);
> -	of_node_put(root);
> -	if (!match) {
> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	domains = match->data;
> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>  	if (!domains) {
> -		pr_debug("PDM: no domains\n");
> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>  		return ERR_PTR(-ENODEV);
>  	}

Here you are mixing two cases:
- There is not match in the table (in which case the driver should print
  a notice)

- There is a match in the table, but the data is NULL (the platform
  doesn't have PDM domains). In this case there should be no notice.

-- 
With best wishes
Dmitry
