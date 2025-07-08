Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3A2DCBFD
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980200; cv=none; b=OaQ8Bs2qcvmzTEkolk5xQndjOuPaCG0Jix0nMmMS/BjWi46vhE40cG8aU/L5JGZweJV+7Ry9wgytRqMk63PP8XRca3VyHQORHlbiWrfyPB9kI07dpjbS2TZceGD48mUykTMXA1wvMhMrhWIkpAKs9OJ90NNziGRSOWaS/BsGVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980200; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XS9ccAncXwT016bZlr8aw55heCqmZwt9DGlt3c8zUCfMl98TTosCXCXeqgpafikL/wYztap63foyVo8ZzuGkyoNEDOf08kCfuBBqjtuvfZs7bUD/Lukf803G56qPQu4wJSa+pndiQ85/LAouh9c96bpzMl+cY259fnn2UTn+Rqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCpbj28q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCpbj28q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAT6g025476
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Jul 2025 13:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=CCpbj28qOrmF3wr+
	ylO4OFXys2TQmkJ2Dmul5uQ3ibyYnDGD2l0rIL4VZTVNuw8+wmsDZu3FFUJvqWIO
	cuXSxQSHSNviD7IHV6qCMxAVfKjH8zVK+5igRyJeKLPbPof6oh0ONw2W4ozKgEI8
	9y0n5wQyvwQIO76VfJD3Rr9DFa2uw483kad2luphG4QLnlQMa0eKAs6JlEWZe8Jy
	qtmkRS1kgi0oS/hxsQ7biMretS3BroonJXIFUxbf+edCiduWrqE3DtFLh6O5iAig
	frEXKZkN1FvwgHY+yIz4yJp9C/kg605PTA4wJFSWG68kYhP8hJd5VHPXmhes35rU
	Btq1hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wdd8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 13:09:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so27586285a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980197; x=1752584997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=kuatMVUnwtQKE1P3L5Gz7aUNQm87URJMkhLQu05QJ4spUT+/rtyjUu2QfnG7A+0DLj
         1a2ukpHyXSZ2f2ArPEnwwRdmGc+cxK9GQalBE7Kv/R8IPAaZYUVga8FaKebgIPZLpvTz
         ixgW4jZBROLh4L+/RgW4mTsDKME8leCFjYjh9IUDPgrkQO7DYgzIJ2mGdUlIcBwo4IgC
         prsGLqkqqWxilkRuGrRyv4anprPrIL4sBz3IWze8FDD0PRAwrDQKvjBYwpwwof356+u+
         4OwxKVmydTk1IfjnzRsRZtHnsFjVwnMZ6rJUWVi91iFnRGM4yHLpdxFk/PwTaDxX15zE
         eD0g==
X-Forwarded-Encrypted: i=1; AJvYcCW9GQI8s/4J+EwZ1/gRNOBpV8B/7AacMi2SBmCXpQw+g+UkMTptkNXobs0Nhwcpz7Pi6OXhxqLkeuqYxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY9qS87Js7CwpHijDaYAqWxn5hVymtMMWxt2T6riWFXsGJM/GL
	QJcWUB1T1FlV8T1+SlhJN1+0E86xmUTXkBXzU1yChNEKBHFZ94SJ7XLgS9eLnkx57uG6F+MzzF4
	8MwGl+NK4HwD3euVDkTreWQ4CaB5zMsn5sS8qvp6fgBaxzHl4stQXk0fQAAB3z7V2cQ==
X-Gm-Gg: ASbGnctmcV8/xM/QcbH96jjS8apKFxK+Q+spJuhpuMPejDV1Rkgyweuf6yTJugZvVdW
	/QcjJ3eHNjxHWXSd18CLv8JhYvczFH+Ffdc6ITC3yX4XzgJbKQlSok3g5zVcVzJSIuJZCqIsigz
	L5RgiT0S1Sd01sWAw/w4X3dDVLETQXIg7kiu3w2NrX8T25vZuYFLQoqG75VzsORqafJEkk0NX48
	HEWeixaf2sjlBkAzfyukKFDlD8zxzXvBqgw+sIQzeaRL2yqdtP5ZpTbwe0lp3c64a2aYryvzXl2
	mVC+Z3F+yUItSJl0NoRn+LY5GIiz4wNpSJG0usHB+E1LA2L3q8H2OQnKeomchia9MUeTfAhMWLW
	JlpE=
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978557385a.1.1751980196521;
        Tue, 08 Jul 2025 06:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2dYjcZuaIWrO6O8xk1UgLVaTuTICWlO228fFZW+hQppHyMeiJyzzbcXYRDvSDFCu/Asg4pA==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978555085a.1.1751980195907;
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb2f890esm7151467a12.61.2025.07.08.06.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Message-ID: <52dfe364-9831-4425-a2bd-0541286b4f74@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7E2qtsInF2xIwcLu-hJTljS1adu6FlCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfX+NGojtJkVzt+
 4jwt2suDzf2/Z7RESsS1S3xcIdgRfAwPNhthOFeQh7ZMw4NhjZbAS8gFMhBjth75j66Cs5OVqiD
 2U0on2yutInYkWpRzAmdTX2x7zX9MTk4kLrAQIX4KiFR60Smqupi68KZIq7uMKyotndDrzWJicx
 rZ3tH8rF9/BiHb4PWvlIjZKkTDI+JfqyVDpe6faSq3d9AfnMpp9kJNmemEOunPRCYDH6gyYR1ei
 Xo6V1JT7WzxLgA+6BOXHSn2eoLQZWVsqA6EEejWdbcnFhTckpnQgPAGG5ek94al5oOa1rMhB+GF
 EmN3dIQ0S1wG2eKbbtxQJl1GW54f3mWYQZAhJg8kQw0pTRYNTb3zh/QZYH7PB/9cByJA9harTdT
 IeJAAstGy1yrbGmOTiUkWMj+ZjyNrMVuRrxBJM4ijYmAsZYkeV5hUVZkqMFQCWjfvGNyvPUO
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d18a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7E2qtsInF2xIwcLu-hJTljS1adu6FlCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=841 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
