Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745DD2C236B
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485598; cv=none; b=oIJ4dFHIf8CMmFHTOCE6gQb8W/5qZWaIzuvSaofnrXJQmiFkQZ03zm31dKqZ177ou2A3gzldSPDGPEibz6gSWUoGpUpqJjXmctcNb8UUhe3txsxDuCcl7LJS/Kj7CV1yONF56OyF0Mm3VX/nQm7T2PQCYrHICYzYqLCCIyAz44k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485598; c=relaxed/simple;
	bh=c8A14Q/V8GEKQyw/Jggt3KvMMi70EOyHMLOV1fzSV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gihq64YIhIRAs8SFbDhs+uQ8uKaEZO3SNRKMRgr5QV0Cqu/DV+Sj2FSNLW/qqT/gAuM6KwY6lUHPK0USjoSjMqruKieTs4pat13PYv9DFSAOZehF3I/q6rDfiNZKilHrN9Hp0J/ffgBMTPVYw7IQTzgiiT5H3DG+AX0RLoGi/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn/g3237; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UM6Z+VDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn/g3237";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UM6Z+VDP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HUYTu642972
	for <linux-sunxi@lists.linux.dev>; Fri, 7 Nov 2025 03:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M80K1COQSKSOsbnYlBiyMzUX
	hbNJGsXiIzf10YFAobU=; b=bn/g3237YhT6RGT/NZXYeOvYm5A3Ef/qBwofC4bb
	ob4Dv/kHYUnPlqmL0Xa1UDS8viZtBnAjyxyHlhbUdzUrYXhO4WGipDF/pR9Akiue
	+PhN6YduFkOcBVFaCl6P/j44ij1qjqOtDIzTtkiR8ARG9UJNrLVau/QwrO4d3Sev
	d5IEuMtiyWEz8BgDIp+/J9i7vls7cUmINJhhat1FNXPnBah8jPCaEUfWi7aXBjKK
	Wb7W4dNnoH3GQCxQF56O02fdue9GWMkmlqu6Ild63nraYcyvLYV/K3nzCadQ0xjj
	RhXXNa2/vwQChQFVbvEhClT+oiAhzPsfv+bBb2rK7oOBLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a904v1fm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 03:19:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so9151341cf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485595; x=1763090395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=UM6Z+VDPEdj1YqtIBNFY7TShVky5UqaoPEJBIJSY1HDJiGI+XUjhHBI8PnpZQO/v8I
         140Ec60jWH8pMtht+Xmz0h6nzUlGZxNTtjF8kpkXkYFB1kw7VxjFO5x2th/Rs2vietbW
         69357VMWGGPdZc5/Bd4LWYEht14uSzHIYNPiwOImxZyXNR3gOz4laF6VUKdSjxzZqQYZ
         3FOND6ws2S8JSIuuN6W7dAk6SOi0CEjfAtYdGx42CUej8dslR8njcL4vYzTeg1C5szHG
         APcvC+d29p58I/DX7Tg+yoHBFmKX3EsJ1o1yT0wI+yjNwAlMzpgk5lXpkHYQe7P1aPQ5
         A6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485595; x=1763090395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=iB2LznunOoVlxRQa3b0XCAE1CV/c+4NXd51qimNynamaAz8kveNELDyhhUd1WU6NAv
         Sz/8Q736F18yCYXKzRvfvo69g8zlG1AX97fTIDAIS8cgBTiJabniFAr8egLJ/CWpO9Xa
         KfgUfSqYw6UcXw9bt9ttQV3Er9dDFH8+ODcQEh1DxX9i6TNL4LiKmLLNwamuO+GRCMpQ
         zFAhVcduu5uir1Y5r3nXuN9npydsIcFASYwHggnj/hmkY+6fgyx450WXjHbAFq+t1mc0
         rME5SLleJ0+dh4ENzVFg7yzb2XEHlgmYm3c7mzcwqrVtymyUH+h/UDpkRDhy390EgBTi
         Bwxg==
X-Forwarded-Encrypted: i=1; AJvYcCUgyWZn0PJindF/Jf8TFEmvCLf8FQDA7QcaT2YNJS8WO3aBp0+cdVx43aCqXpx/cHmPJkTGOw0mVQKAjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyBRyfU5M8UfEO7xvtz+1495vFfM2nLXCORZFnumXK/w1RH+QV
	5g4UWNTVxz/wM6L4kAeQUHCOdTYOJzS2Ku2NYRHW1S6HgDHoUDHQRBrwd/CgHbkE9mFqbbmfHV7
	yaS/l0axMBNg4NfiaaKVDuo01xkHuN8CchSy1Cdnz9AEUYMhP2csGePl983z4wfKJFw==
X-Gm-Gg: ASbGncs44icJDVGyr1Ou0dRheuiJnSbKdfSETXRQf28o7Rxm0322l7N8HZQFP4yD0dv
	YyL8tR/CFOXdog+3CdB2kgN7Lk0OWazY9GFMn+kkrqHatZLlHW6J0KnixwI2cS+RtIqehcRCP7q
	a2avi1iyu8cgpe6tHVIBy0WyUZp+tScTcY9Dc7XS+wNDqCw1+Yg4P9WPmZn/JnWHyFUVMBf3RmQ
	XIoLrmGby/T0kHDlwl/hI+JL68jZaaiUzJz6FDEvj0rcrtSLLBtyczM26xWHiUWIyPOCtBcZtje
	4SyNZZ6zVtc+PBAeFFwyyv9ex2w9OYlWDUBTPElgjNitmbogr/Tm+aKoKrekb1DVIUucpVIqELz
	kxmuudFgBL/oRzqXuIF43SIfrdpwdN72PkmR8Kw2pBmtSGFuNhRqgK7mDZmO4KSfcONM8DhEHVp
	V2rxJuoi4ENdGe
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772751cf.50.1762485594824;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pxfXAI2QN5tx3rdS8w62pU9piMwAcGPSHdAchfcF87faMpVG/a4sNiNd3ZJ914ce0ITvXw==
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772491cf.50.1762485594416;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a593af0sm1136865e87.96.2025.11.06.19.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:52 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:50 +0200
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
Subject: Re: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Message-ID: <zdnlmxrlagpmwcfnzka7zgmrxzya564cjbd56l22fazxxhqpjw@64zf3akyfp4h>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
X-Authority-Analysis: v=2.4 cv=RMK+3oi+ c=1 sm=1 tr=0 ts=690d655b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=228_68lKBFQWPJCgatoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X37eRMqLxVh0f8EQanLjuiqRVMhCo7l7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfX9aGbZmgBnW7P
 fkoLqpMY74PhDtxaYobn6nNPFM3b+0SGiQ/WjFOiN7A6wTwril6kjIbT8NYmqF1ZdOsU6bWo+E3
 OfKnKWKvvpe3/WkAi2bwKfoID86pu05xs3qlVCcImoKOlZ3QA3mBdMe/7tAzdfoiv7UQUG5Cwa9
 s5IBlz/tFOFah0zzDLDj2MI1eRx3dj0pbu0gIH+OyrFiWziQUImPB2hj99v0+Wa88LPVkxYpH+j
 2l1KtyEQ47v4LM/6BL2XOljIgTTPXiIuE3E6IrMOrqNzHHyNCPqi/HMWWdwnkBo/G+amvb6F8LU
 gPpIZX84GUxetQWFjgInwp5nZppXI2fjJhnIavyPQO0DczOxqdW5biBsCEvZyl17h0FEF4n2iiy
 oQqjut7mxfZlm7EMoTdAoucijL72Tw==
X-Proofpoint-GUID: X37eRMqLxVh0f8EQanLjuiqRVMhCo7l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070024

On Thu, Nov 06, 2025 at 08:07:19PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/ubwc_config.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
