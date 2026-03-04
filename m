Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01D3845D4
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668622; cv=none; b=bTJMbCoehueGe68+FKo4XQdc4WhySD2DfDu6YQzUnQbSKEKgKi/8B6CiWgFPQrhy1SOQee3UScy4Ixrpct85DUmChSAEEp7reybOUvGTkPr8s+tAgVc5BdFxywXpNwbHP2ITLYRYOgCgmnwGMiahgxQCpcnUjybw6LZnyokkQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668622; c=relaxed/simple;
	bh=Q0RmGTaWyrNXkoqSRC4NOGoeVMXVms2krIlt4cMtsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLR6ObABLiDLlR/dNz7aKkiQ4cMZDnqonp1UrJIdmnYd8LVo3+QQNV8xS/V0/AlsMoSQUH9sL4qTS/S3P6UB5F1AwO/HFh0LghcVXIX03JsLhVhRJG9k9/mOHmzZOkhpG+7NBP16+gYHuSTbZMhot0SXyF5NlyP6olG7O3aH47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3gyhoDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtF3lp8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtF3lp8i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624LSQMi2275163
	for <linux-sunxi@lists.linux.dev>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4muqgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fa82ebb9so240795386d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=KtF3lp8ikkz+h1ulfcxF+PRBh0JYJzc4c2HSe4pi6+GIvNDfp7o6h7ME5WiayBeNg4
         FYaHwnnnNk4DjzmKENlGTGaYmXWp+P2uBpobHqLh3UFynBUOxuk4KbNu3q9triprQ7wx
         yMUl7L37ZDUp9Muh0yMSksrBcRdI1MdZCiCY61++7Ax7Hukp+r3phcx+Ef3NvbqlmWif
         zzI06yoKbqd6fYpvF19UdfLOt83D9b+nO/YGmh6P9Z+8jC2eNkkLNOElTDgCgf80TtIJ
         1hKcaH8qUtLbVvQMlmacqdta6r+nPpOGf9n4D8rPktjtCYMFqsmceWD87IQquwu3mx1M
         Qmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=gP1ri0f36/K67tSbPfz8BVcnnIptDznkwmqUvR/B1JlRYWUV1jqRhOd6TnMsU82Da0
         TPzuJN1HYfm4dFFCAVhadofRLjfrKi82C6szYA7cqUcBssq46u5R0ZjnGR5/9Pq6ybCV
         PoAmRkP91tG4C3KggsrFTeUaucCHbcbrsY+dcY0zLdVatjLXaq2O67KCRS4LWm1Vwfs1
         xy9hsqGyQPDW6pgJqJ5rf7N+5JrFg8UlmqKJ8iKZXsdKx72RKA5mC5UdA7numtEs9Svg
         9Y4PN2MClHzRor2xkkCW441IxfkgKW8SQJmJSxsg7LEbADIG2CEPg3KweTzbuskOhywp
         /Q/A==
X-Forwarded-Encrypted: i=1; AJvYcCWsu2lEOu7FNjFEVaDzpQNwD8xLZFnvo1K1bbiiWWc0F4xUenbptb8pxQBN9YY8QV7Sf0iL6QTGC7Z6/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAEKjC3ydEuFDBYMlNZBglrh/EDw78zIbSu/y16hFp+VL+rBYq
	fHmpBD5wfY/9YPENyVbNHq1z4VEhwIA60FUDaqIzRQLWycGyFbN6YXX9K+LmT0NLT+ctAvT7sPr
	E3L4NAbGZHK0lwU1/jozJGEKHjLssNYU1Aj0fc9Ke1A+w2FqKZ/+LTtwRN74SAjXvdg==
X-Gm-Gg: ATEYQzzu10pZwbhbDeS0PgPoQ7K5CINnp7Xqre3Bck1SGCNs1VuAXh8M7ggbdNVA+fT
	jaHJeD4drYYZ/mnTJn9EiHJT2xYjHhG02nnIYXzRcsukujm4aEIfdO3ODVw75cz7o0nuDU922fV
	wavTg+cLNurqktxMMhpaAeS4X7giC+uH9IxADLi+whI/gCRhS63cKFNQKUhCWOstHSFpBdqTh14
	qFjy7f8tIu5iZF485tBdFgOnsbGsdmCnHnHfaOyOqou48YfHUur7toiumPKWRD/Rlc0EK+BR2qj
	eIX+dx1tRAvpUNZt5NZaQV9QhAmVnXprlzM8so/okNhvGUNUMstGa9E3cyKXE0skE8pMn+dB+qR
	I+MsKB77yEG9wAmEkfPMBrmEKywyqY6L7IUPAezL+ful+iypC0MMLj4Kncd4CX5fsVAFvAqEizj
	zzbHliyoIGPSoSC86j+GAjDWt0ME7rLql+DnQ=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481318685a.40.1772668618474;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: qhj_IWMDggFCoxrsUarJoPZbCxLVixtG
X-Proofpoint-GUID: qhj_IWMDggFCoxrsUarJoPZbCxLVixtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX3iZHTmNtnvsH
 4ymTEnLgh1FjsZZzljp/H3qiS0RY0+g9b1f0ZFAc6ZY0dWIUki5Metu8FlsLkq1WJ8Gh3dh3h7X
 1svYYQ7nS9w6zZo3l7vqUXzDK/c1xS2KpS2VzwQQB2ttgTZVUoXe6JotAEcAWai9CGJElojlBM6
 LO1GZ7Kbag4RledX09j4JxjQIyzgQcwycII9MBjOwC17qP7hCYq1iqVaWOghWm9ZVP5C7f9AYXc
 KkneeH1sghhjR84PvbT91EgaEtZNajo87D5frA6z/OtmzVe+wdqzdwJZhGncY1ARarUYth650oW
 nTgDNK/aLXQbe9dDVzccI6xlTLw2eZctiYV5vSP039TUU+5S0wrVcgxnEaT/YZ3/XkIjdSEwBom
 DDg3jvYCn+T0yBd3cC1zErV9/pphTe0augCCNk2fxToMHwkKk85lQc1PKCDS4Zwdd9lk0UFKSYK
 CBoeeSqcV7XBUJ5Vmxw==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040198

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
